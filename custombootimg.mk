$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel)
	@echo -e ${PRT_IMG}"----- Making recovery ramdisk (xz) ------"${CL_RST}
	xz --check=crc32 --x86 --lzma2=dict=32MiB -c $(recovery_uncompressed_ramdisk) > $(recovery_ramdisk)
	@echo -e ${PRT_IMG}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE))
	@echo -e ${PRT_IMG}"----- Made recovery image: $@ --------"${CL_RST}
