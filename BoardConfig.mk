#
# Copyright (C) 2014 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_DEVICE := kltedcmactive
TARGET_NO_BOOTLOADER := true

# Architecture (Krait 400 32-bit ARMv7-A)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

# Kernel & Boot image
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 dwc3.maximum_speed=high dwc3_msm.prop_chg_detect=Y androidboot.bootdevice=msm_sdcc.1 androidboot.selinux=permissive
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/samsung/msm8974
TARGET_KERNEL_CONFIG := lineageos_kltedcmactive_defconfig
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/kltedcmactive/mkbootimg.mk

# Partitions & Storage (Standard 16GB eMMC layout for NTT docomo SC-02G)
# LineageOS 15.1 fits completely inside stock 2.39GB system partition without PIT modification!
BOARD_BOOTIMAGE_PARTITION_SIZE := 14680064       # 14 MB (boot)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216   # 16 MB (recovery)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2506096640   # 2390 MB (stock system partition - fits Oreo perfectly!)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12513411072 # ~11.6 GB (userdata)
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200     # 200 MB (cache)
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Display & Graphics (Adreno 330 OpenGL ES 3.0)
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_C2D_COMPOSITION := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_EGL_CFG := device/samsung/kltedcmactive/configs/egl.cfg

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true

# Bluetooth (Broadcom BCM4339)
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/kltedcmactive/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/samsung/kltedcmactive/bluetooth/vnd_kltedcmactive.txt

# Camera (Native Legacy HAL1 in LineageOS 15.1 for Samsung ISOCELL S5K2P2XX 16MP)
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_USES_MEDIA_EXTENSIONS := true
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_HARDWARE
USE_DEVICE_SPECIFIC_CAMERA := true

# Radio / RIL (NTT docomo LTE Band 1/3/19/21 & FOMA 3G)
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := mdm9625m
TARGET_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING
PROTOBUF_SUPPORTED := true

# NFC & FeliCa
BOARD_NFC_CHIPSET := pn547
TARGET_USES_NQ_NFC := false

# Sensors (MAX86900 Heart Rate, LPS25H Barometer, AKM09911 Compass, MPU6500)
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Active Key & Physical Navigation Buttons (Galaxy S5 Active Special Hardware)
BOARD_HARDWARE_KEYS := true
BOARD_HAS_PHYSICAL_NAV_KEYS := true
BOARD_HAS_NO_FINGERPRINT := true

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
