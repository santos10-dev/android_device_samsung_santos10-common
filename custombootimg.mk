TWRP_VERSION := $(shell cat bootable/recovery/variables.h | grep TW_VERSION_STR | cut -d\" -f2)
TWRP_NAME := twrp-$(TWRP_VERSION)-$(TARGET_DEVICE)

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel)
	@echo -e ${PRT_IMG}"----- Making recovery ramdisk (xz) ------"${CL_RST}
	xz --check=crc32 --x86 --lzma2=dict=32MiB -c $(recovery_uncompressed_ramdisk) > $(recovery_ramdisk)
	@echo -e ${PRT_IMG}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE))
	@echo -e ${PRT_IMG}"----- Made recovery image: $@ --------"${CL_RST}
	@echo -e ${PRT_IMG}"----- Making odin recovery image ------"${CL_RST}
	cd $(PRODUCT_OUT) && tar -H ustar -c $(shell basename $@) > $(TWRP_NAME).tar
	cd $(PRODUCT_OUT) && md5sum -t $(TWRP_NAME).tar >> $(TWRP_NAME).tar
	mv $(PRODUCT_OUT)/$(TWRP_NAME).tar $(PRODUCT_OUT)/$(TWRP_NAME).tar.md5
	@echo -e ${PRT_IMG}"----- Made odin recovery image: $(PRODUCT_OUT)/$(TWRP_NAME).tar.md5 --------"${CL_RST}
