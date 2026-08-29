#
# Copyright (C) 2014-2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from klte-common (common Galaxy S5 configurations)
$(call inherit-product, device/samsung/klte-common/klte.mk)

# Device Overlay
DEVICE_PACKAGE_OVERLAYS += \
    device/samsung/kltedcmactive/overlay

# Hardware features permissions for docomo Active variant
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml

# Keylayout & Physical Hardware Buttons
# Galaxy S5 Active has mechanical click buttons (Home, Back, Recent) and orange Active Key!
PRODUCT_COPY_FILES += \
    device/samsung/kltedcmactive/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    device/samsung/kltedcmactive/keylayout/synaptics_rmi4_i2c.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/synaptics_rmi4_i2c.kl

# Audio configuration
PRODUCT_COPY_FILES += \
    device/samsung/kltedcmactive/configs/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
    device/samsung/kltedcmactive/configs/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    device/samsung/kltedcmactive/configs/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# GPS configuration
PRODUCT_COPY_FILES += \
    device/samsung/kltedcmactive/configs/gps.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/gps.conf

# Media & Codecs
PRODUCT_COPY_FILES += \
    device/samsung/kltedcmactive/configs/media_profiles.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles.xml \
    device/samsung/kltedcmactive/configs/media_codecs.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs.xml

# NFC (NXP PN547)
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    com.android.nfc_extras

PRODUCT_COPY_FILES += \
    device/samsung/kltedcmactive/configs/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

# Screen density for 5.1" 1080x1920 FHD AMOLED (432 dpi -> standard 480dpi)
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Call vendor blobs
$(call inherit-product-if-exists, vendor/samsung/kltedcmactive/kltedcmactive-vendor.mk)
