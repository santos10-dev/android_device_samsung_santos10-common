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

ENABLE_CPUSETS := true

TARGET_BOARD_PLATFORM := clovertrail
TARGET_BOOTLOADER_BOARD_NAME := clovertrail

MALLOC_SVELTE := true

# Specific headers
TARGET_BOARD_KERNEL_HEADERS := device/samsung/santos10-common/kernel-headers
TARGET_SPECIFIC_HEADER_PATH := device/samsung/santos10-common/include

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/samsung/santos10
TARGET_KERNEL_CONFIG := cyanogenmod_santos10_defconfig

KERNEL_TOOLCHAIN_PREFIX := x86_64-linux-android-
BOARD_KERNEL_IMAGE_NAME := bzImage

# Filesystem
TARGET_KERNEL_HAVE_EXFAT := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

BOARD_BOOTIMAGE_PARTITION_SIZE     := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2474639360
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12654198784 # 12654215168 - 16384
BOARD_CACHEIMAGE_PARTITION_SIZE    := 367001600

BOARD_FLASH_BLOCK_SIZE := 1024

# Use samsung specific code
BOARD_VENDOR := samsung

# Dexopt
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
  endif
endif

# Video
ENABLE_IMG_GRAPHICS := true
TARGET_DISABLE_CURSOR_LAYER := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINY_ALSA_AUDIO := true

# Multimedia
BUILD_WITH_FULL_STAGEFRIGHT := true
BOARD_USES_WRS_OMXIL_CORE := true
INTEL_VA := true
BOARD_USES_MRST_OMX := true

BOARD_GLOBAL_CFLAGS += -DMIXVBP_KK_BLOBS

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/bcmdhd_apsta.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := device/samsung/santos10-common/bluetooth/vnd_santos10.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/santos10-common/bluetooth

# Sensors
BOARD_USE_LEGACY_SENSORS_FUSION := true

# CMHW
BOARD_HARDWARE_CLASS += device/samsung/santos10-common/cmhw

# OpenGL
USE_OPENGL_RENDERER := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm7260
BOARD_MODEM_NEEDS_VIDEO_CALL_FIELD := true
BOARD_RIL_CLASS := ../../../device/samsung/santos10-common/ril

# Security
BOARD_SEPOLICY_DIRS += device/samsung/santos10-common/sepolicy

# Charger mode
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_HEALTHD_CUSTOM_CHARGER_RES := device/samsung/santos10-common/charger/images

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_FSTAB := device/samsung/santos10-common/rootdir/fstab.santos10
