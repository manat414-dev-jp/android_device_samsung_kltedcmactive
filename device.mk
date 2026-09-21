#
# Copyright (C) 2014 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/kltedcmactive/kltedcmactive-vendor.mk)
$(call inherit-product-if-exists, vendor/samsung/klte-common/klte-common-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Keylayout (Galaxy S5 Active physical keys & Active Key)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# NFC - NTT Docomo Sony CXD224x
-include $(COMMON_PATH)/nfc/sony/product.mk
TARGET_ENABLE_SMARTCARD_SERVICE := true
PRODUCT_PACKAGES += \
    org.simalliance.openmobileapi.xml \
    org.simalliance.openmobileapi

# Shim libraries for Marshmallow 6.0 Blobs on Oreo 8.1
PRODUCT_PACKAGES += \
    libshim_cutils_atomic \
    libshim_ril \
    libshim_camera

# NTT Docomo / SC-02G Specific Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.dcm.feature=1 \
    ro.telephony.default_network=9 \
    telephony.lteOnGsmDevice=1 \
    rild.libpath=/system/vendor/lib/libsec-ril.so

# common klte
$(call inherit-product, device/samsung/klte-common/klte.mk)
