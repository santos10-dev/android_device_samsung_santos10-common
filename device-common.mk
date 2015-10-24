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

LOCAL_PATH := device/samsung/santos10-common

# Marshmallow compatibility library
PRODUCT_PACKAGES += \
    libmmcompat

# Video
PRODUCT_PACKAGES += \
    libdrm \
    libgccdemangle \
    pvrsrvctl

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/idc/sec_keyboard.idc:system/usr/idc/sec_keyboard.idc \
    $(LOCAL_PATH)/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    $(LOCAL_PATH)/usr/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.santos10.rc:root/init.santos10.rc \
    $(LOCAL_PATH)/rootdir/init.santos10.usb.rc:root/init.santos10.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.santos10.rc:root/ueventd.santos10.rc \
    $(LOCAL_PATH)/rootdir/fstab.santos10:root/fstab.santos10

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

PRODUCT_CHARACTERISTICS := tablet

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)

$(call inherit-product, vendor/samsung/santos10-common/device-common-vendor-blobs.mk)
