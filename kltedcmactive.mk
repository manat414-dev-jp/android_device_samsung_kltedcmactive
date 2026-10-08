#
# Copyright (C) 2022 The LineageOS Project
# Copyright (C) 2022 crDroid Android Project
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

COMMON_PATH := device/samsung/msm8974-common

# Soong
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-crdroid

# Audio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/audio/klte/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(COMMON_PATH)/audio/klte/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Display Device Config
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/displayconfig/klte/display_id_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_0.xml

# Keylayouts (Active specific: physical keys + Active key)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# NFC
$(call inherit-product, device/samsung/msm8974-common/nfc/pn547/product.mk)

# msm8974-common
$(call inherit-product, device/samsung/msm8974-common/common.mk)

# System Properties
$(call inherit-product, $(LOCAL_PATH)/system_prop.mk)

# Get non-open-source specific aspects (safe guarded)
$(call inherit-product-if-exists, vendor/samsung/kltedcmactive/kltedcmactive-vendor.mk)
$(call inherit-product-if-exists, vendor/samsung/msm8974-common/msm8974-common-vendor.mk)
