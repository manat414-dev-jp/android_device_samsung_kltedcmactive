#
# Copyright (C) 2024 TeamWin Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit common TWRP / Omni recovery configuration
$(call inherit-product-if-exists, vendor/twrp/config/common.mk)
$(call inherit-product-if-exists, vendor/omni/config/common.mk)

# Inherit from standard base product
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit device configurations
$(call inherit-product, device/samsung/kltedcmactive/device.mk)

PRODUCT_DEVICE := kltedcmactive
PRODUCT_NAME := twrp_kltedcmactive
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SC-02G
PRODUCT_MANUFACTURER := samsung
PRODUCT_RELEASE_NAME := Samsung Galaxy S5 Active (NTT docomo)
