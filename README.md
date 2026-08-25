# Device Tree for Samsung Galaxy S5 Active (NTT docomo SC-02G / kltedcmactive)

[![LineageOS](https://img.shields.io/badge/LineageOS-15.1-blue.svg)](https://lineageos.org/)
[![Android Version](https://img.shields.io/badge/Android-8.1.0_Oreo-green.svg)](https://source.android.com/)
[![SoC](https://img.shields.io/badge/SoC-Qualcomm_MSM8974PRO--AC-orange.svg)](https://www.qualcomm.com/snapdragon)
[![Target](https://img.shields.io/badge/Device-SC--02G_(kltedcmactive)-red.svg)](https://www.nttdocomo.co.jp/)

This repository contains the LineageOS 15.1 (Android 8.1.0 Oreo) device tree configuration for the **Samsung Galaxy S5 Active (NTT docomo SC-02G / kltedcmactive)**.

---

## ⚡ Why LineageOS 15.1 (Android 8.1 Oreo) for SC-02G?

- **🚀 Silky Smooth 60fps Performance:** The Snapdragon 801 (MSM8974PRO-AC) paired with 2GB LPDDR3 RAM operates at maximum efficiency on Android 8.1.
- **💾 Fits Stock 2.39GB System Partition:** Zero need for dangerous PIT repartitioning; LineageOS 15.1 + OpenGApps 8.1 fits comfortably with over 800MB spare space!
- **📸 Flawless 16MP Camera HAL1:** Native legacy Samsung Camera HAL support with full ISOCELL 16MP resolution, HDR, 4K video recording, and zero crashing.
- **🔋 Superior Battery Endurance:** Up to 2-3x better idle & screen-on battery life compared to Android 11+ due to native 32-bit Dalvik/ART optimization without heavy Treble shim overhead.
- **📶 docomo LTE Band 19/21 & VoLTE:** Fully tuned RIL for Japan NTT docomo network.
- **🔘 Dedicated Orange Active Key:** `GPIO 91` (`key 249 APP_SWITCH`) mapped for instant flashlight, camera shutter, or custom shortcut.

---

## 📱 Hardware Specifications

| Item | Specification |
| :--- | :--- |
| **Model** | NTT docomo SC-02G (Samsung Galaxy S5 Active) |
| **Codename** | `kltedcmactive` |
| **Chipset** | Qualcomm Snapdragon 801 (MSM8974PRO-AC) |
| **CPU** | Quad-core 2.46 GHz Krait 400 |
| **GPU** | Adreno 330 (578 MHz) |
| **RAM** | 2 GB LPDDR3 |
| **Internal Storage** | 16 GB eMMC 5.0 (MicroSD up to 128 GB) |
| **Display** | 5.1" Super AMOLED FHD (1080 x 1920 pixels, 432 ppi) |
| **Rear Camera** | 16 MP Samsung ISOCELL (S5K2P2XX), f/2.2, 4K UHD video |
| **Front Camera** | 2.1 MP (S5K6B2), 1080p video |
| **Battery** | Removable Li-Ion 2800 mAh |
| **Sensors** | Barometer, Compass, Heart Rate (MAX86900), Gyro, Accel |
| **NFC / FeliCa** | NXP PN547 with Osaifu-Keitai support |
| **Buttons** | 3 Mechanical Front Keys + Dedicated Side **Orange Active Key** |

---

## 🛠️ How to Build LineageOS 15.1 for kltedcmactive

### 1. Initialize LineageOS 15.1 Source Tree
```bash
mkdir -p ~/android/lineage-15.1 && cd ~/android/lineage-15.1
repo init -u https://github.com/LineageOS/android.git -b lineage-15.1 --git-lfs
```

### 2. Add Local Manifest
Create `.repo/local_manifests/kltedcmactive.xml`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <!-- Device Tree for SC-02G -->
  <project name="manattylinux/android_device_samsung_kltedcmactive" path="device/samsung/kltedcmactive" remote="github" revision="lineage-15.1" />

  <!-- MSM8974 Common Kernel -->
  <project name="LineageOS/android_kernel_samsung_msm8974" path="kernel/samsung/msm8974" remote="github" revision="lineage-15.1" />

  <!-- Samsung Hardware & RIL -->
  <project name="LineageOS/android_hardware_samsung" path="hardware/samsung" remote="github" revision="lineage-15.1" />
  <project name="LineageOS/android_hardware_samsung_ril" path="hardware/samsung_ril" remote="github" revision="lineage-15.1" />

  <!-- Vendor Blobs -->
  <project name="TheMuppets/proprietary_vendor_samsung" path="vendor/samsung" remote="github" revision="lineage-15.1" />
</manifest>
```

### 3. Sync Repositories
```bash
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

### 4. Extract Proprietary Blobs
If you have an ADB-connected SC-02G:
```bash
cd ~/android/lineage-15.1/device/samsung/kltedcmactive
./extract-files.sh
```

### 5. Build ROM
```bash
cd ~/android/lineage-15.1
source build/envsetup.sh
breakfast kltedcmactive
export USE_CCACHE=1
ccache -M 50G
brunch kltedcmactive
```

Output ROM package:
```bash
out/target/product/kltedcmactive/lineage-15.1-*-UNOFFICIAL-kltedcmactive.zip
```

---

## 📜 License
- **Device Tree:** Apache License 2.0
- **Kernel Code:** GNU General Public License v2 (GPL-2.0)
