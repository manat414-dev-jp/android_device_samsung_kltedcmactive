#
# Copyright (C) 2024 TeamWin Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_DEVICE := kltedcmactive
TARGET_OTA_ASSERT_DEVICE := kltedcmactive,SC-02G,sc02g,kltedcm
TARGET_NO_BOOTLOADER := true

# Architecture (Qualcomm Krait 400 / 32-bit ARMv7-A)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

# Platform & GPU
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

# Kernel Parameters & Offsets
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 dwc3.maximum_speed=high dwc3_msm.prop_chg_detect=Y androidboot.bootdevice=msm_sdcc.1 androidboot.selinux=permissive
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_CONFIG := lineageos_kltedcmactive_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/msm8974
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/kltedcmactive/mkbootimg.mk

# Legacy Non-System-As-Root Configuration (SC-02G has dedicated recovery partition)
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# Partition Sizes (SC-02G 16GB eMMC Layout)
BOARD_BOOTIMAGE_PARTITION_SIZE := 14680064        # 14MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216    # 16MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2506096640     # 2.39GB (2390MB)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12513411072  # ~11.6GB
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200       # 200MB
BOARD_FLASH_BLOCK_SIZE := 131072

# File Systems (EXT4 & F2FS Dual Support)
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Display & Color Configuration (1080x1920 Super AMOLED / Adreno 330)
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
DEVICE_RESOLUTION := 1080x1920
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
RECOVERY_GRAPHICS_FORCE_USE_LINELENGTH := true

# TWRP 3.7+ Recovery Flags
RECOVERY_VARIANT := twrp
TARGET_RECOVERY_FSTAB := device/samsung/kltedcmactive/recovery/root/recovery.fstab
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := ja
TW_NO_USB_STORAGE := true
TW_INCLUDE_CRYPTO := false
TW_EXCLUDE_SUPERSU := true
TW_USE_TOOLBOX := true
TW_HAS_MTP := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_CUSTOM_CPU_POS := "300"
TW_CUSTOM_CLOCK_POS := "80"

# Samsung Specific TWRP Options
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := false

# Hardware Keys & Buttons (Galaxy S5 Active dedicated physical key & front buttons)
BOARD_HARDWARE_KEYS := true
BOARD_HAS_PHYSICAL_NAV_KEYS := true
BOARD_HAS_NO_FINGERPRINT := true
