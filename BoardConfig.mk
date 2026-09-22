#
# Copyright (C) 2014-2016 The CyanogenMod Project
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

# inherit from common klte
include device/samsung/klte-common/BoardConfigCommon.mk

TARGET_OTA_ASSERT_DEVICE := SC-02G,kltedcmactive,klteactive,klte

# Kernel
TARGET_KERNEL_CONFIG := lineage_klteactivexx_defconfig

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm8974
TARGET_LIBINIT_MSM8974_DEFINES_FILE := device/samsung/kltedcmactive/init/init_klte.cpp

# NFC - NTT Docomo Sony CXD224x (uses klte-common generic NFC board config)
include $(COMMON_PATH)/nfc/board.mk

# Radio/RIL
include $(COMMON_PATH)/radio/single/board.mk

# NTT Docomo SC-02G 16GB PIT (KACTIVE_JPN_DCM.pit) Partition Sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 13631488
BOARD_CACHEIMAGE_PARTITION_SIZE := 524288000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2548039680
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12442369024 # 12442385408 - 16384

# Legacy BLOB Support & Shims for Marshmallow 6.0 Blobs on Oreo 8.1
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_LD_SHIM_LIBS += \
    /system/vendor/lib/libsec-ril.so|libshim_cutils_atomic.so \
    /system/vendor/lib/libsec-ril.so|libshim_ril.so \
    /system/vendor/lib/hw/camera.vendor.msm8974.so|libshim_camera.so

# inherit from the proprietary version
-include vendor/samsung/kltedcmactive/BoardConfigVendor.mk
-include vendor/samsung/klte-common/BoardConfigVendor.mk
