#
# Copyright 2013 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Architecture
TARGET_ARCH := x86
TARGET_ARCH_VARIANT := atom
TARGET_CPU_ABI := x86

TARGET_BOARD_PLATFORM := clovertrail
TARGET_BOOTLOADER_BOARD_NAME := clovertrail

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/samsung/santos10
TARGET_KERNEL_CONFIG := aosp_santos10_defconfig

KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_PREBUILT_TAG)/x86/x86_64-linux-android-4.8/bin
KERNEL_TOOLCHAIN_PREFIX := x86_64-linux-android-
BOARD_KERNEL_IMAGE_NAME := bzImage

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_BOOTIMAGE_PARTITION_SIZE     := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2474639360
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12654198784 # 12654215168 - 16384
BOARD_CACHEIMAGE_PARTITION_SIZE    := 367001600

BOARD_FLASH_BLOCK_SIZE := 131072

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME          := "dhd"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/vendor/firmware/bcmdhd_sta.bin nvram_path=/vendor/firmware/nvram_net.txt"

# OpenGL
USE_OPENGL_RENDERER := true

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/santos10-common/rootdir/fstab.santos10
