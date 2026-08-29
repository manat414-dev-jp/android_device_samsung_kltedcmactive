#
# Copyright (C) 2014 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from standard klte-common board config
include device/samsung/klte-common/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_DEVICE := kltedcmactive
TARGET_OTA_ASSERT_DEVICE := kltedcmactive,SC-02G,sc02g,kltedcm

# Kernel configuration
TARGET_KERNEL_CONFIG := lineageos_kltedcmactive_defconfig

# Bluetooth (Broadcom BCM4339)
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/kltedcmactive/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/samsung/kltedcmactive/bluetooth/vnd_kltedcmactive.txt

# Partitions & Storage (Standard 16GB eMMC layout for NTT docomo SC-02G)
# LineageOS 15.1 fits completely inside stock 2.39GB system partition without PIT modification!
BOARD_BOOTIMAGE_PARTITION_SIZE := 14680064       # 14 MB (boot)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216   # 16 MB (recovery)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2506096640   # 2390 MB (stock system partition - fits Oreo perfectly!)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12513411072 # ~11.6 GB (userdata)
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200     # 200 MB (cache)
BOARD_FLASH_BLOCK_SIZE := 131072

# Active Key & Physical Navigation Buttons (Galaxy S5 Active Special Hardware)
# SC-02G has 3 physical mechanical front click buttons (Home, Back, Recent) and Orange Active Key
BOARD_HARDWARE_KEYS := true
BOARD_HAS_PHYSICAL_NAV_KEYS := true
BOARD_HAS_NO_FINGERPRINT := true

# Radio / RIL (NTT docomo Single-SIM LTE Band 1/3/19/21)
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := mdm9625m
TARGET_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

# Recovery (TWRP / Lineage Recovery)
TARGET_RECOVERY_FSTAB := device/samsung/kltedcmactive/recovery/root/recovery.fstab
RECOVERY_VARIANT := twrp
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_NO_USB_STORAGE := true
TW_INCLUDE_CRYPTO := false
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true

# Inherit proprietary vendor blobs
-include vendor/samsung/kltedcmactive/BoardConfigVendor.mk
