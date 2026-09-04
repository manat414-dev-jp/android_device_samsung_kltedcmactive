#
# Copyright (C) 2024 TeamWin Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/samsung/kltedcmactive

# Display & Density (1080x1920 Full HD / 480dpi)
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# TWRP Package
PRODUCT_PACKAGES += \
    twrp

# Recovery init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    $(LOCAL_PATH)/recovery/root/ueventd.qcom.rc:root/ueventd.qcom.rc \
    $(LOCAL_PATH)/recovery/root/etc/twrp.flags:root/etc/twrp.flags

# Default TWRP Japanese language & Screen settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.default_language=ja \
    ro.sf.lcd_density=480
