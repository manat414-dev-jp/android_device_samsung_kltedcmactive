#
# Copyright (C) 2014-2016 The CyanogenMod Project
# Copyright (C) 2021-2022 The LineageOS Project
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

# Inherit from common msm8974
include device/samsung/msm8974-common/BoardConfig.mk

DEVICE_PATH := device/samsung/kltedcmactive

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(DEVICE_PATH)/bluetooth/vnd_kltedcmactive.txt
BOARD_HAVE_SAMSUNG_BLUETOOTH := true

# Build Fingerprint (SC-02G Stock 6.0.1 Marshmallow)
BUILD_FINGERPRINT := samsung/kltedcmactive/kltedcmactive:6.0.1/MMB29M/SC02GOMU2CQB1:user/release-keys

# Kernel
# lineage_klteactivexx_defconfig includes CONFIG_SEC_KACTIVE_PROJECT=y,
# which generates msm8974pro-ac-sec-kactiveltedcm-r02.dtb.
TARGET_KERNEL_CONFIG := lineage_klteactivexx_defconfig

# SELinux (Permissive for initial bringup verification)
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_kltedcmactive
TARGET_RECOVERY_DEVICE_MODULES := libinit_kltedcmactive

# Manifests
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := kltedcmactive,SC-02G,sc02g,klteactive,kltedcm,klte

# Partition Sizes
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2411724800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12507380736

# NFC
include $(COMMON_PATH)/nfc/pn547/board.mk

# Inherit from the proprietary version (guarded with -include)
-include vendor/samsung/kltedcmactive/BoardConfigVendor.mk
-include vendor/samsung/msm8974-common/BoardConfigVendor.mk
