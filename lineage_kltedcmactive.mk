#
# Copyright (C) 2014-2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from device.mk
$(call inherit-product, device/samsung/kltedcmactive/device.mk)

# Inherit some common LineageOS 15.1 stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier
PRODUCT_DEVICE := kltedcmactive
PRODUCT_NAME := lineage_kltedcmactive
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SC-02G
PRODUCT_MANUFACTURER := samsung

# Build fingerprint & properties for NTT docomo Galaxy S5 Active
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=kltedcmactive \
    TARGET_DEVICE=kltedcmactive \
    BUILD_FINGERPRINT="samsung/kltedcmactive/kltedcmactive:6.0.1/MMB29M/SC02GOMU1CPB1:user/release-keys" \
    PRIVATE_BUILD_DESC="kltedcmactive-user 6.0.1 MMB29M SC02GOMU1CPB1 release-keys"

# Set Japanese locale as default for docomo variant and Single-SIM RIL configs
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.locale=ja-JP \
    ro.telephony.default_network=9 \
    telephony.lteOnGsmDevice=1 \
    ro.ril.telephony.mqanelements=6 \
    ro.telephony.ril_class=SamsungMSM8974RIL \
    rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so \
    rild.libargs=-d /dev/smd0 \
    persist.radio.add_power_save=1 \
    ro.config.low_ram=false
