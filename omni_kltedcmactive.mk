#
# Copyright (C) 2024 TeamWin Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from standard AOSP base or minimal TWRP
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit device configurations
$(call inherit-product, device/samsung/kltedcmactive/device.mk)

PRODUCT_DEVICE := kltedcmactive
PRODUCT_NAME := omni_kltedcmactive
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SC-02G
PRODUCT_MANUFACTURER := samsung
PRODUCT_RELEASE_NAME := Samsung Galaxy S5 Active (NTT docomo)
