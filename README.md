# TWRP 3.7+ Device Tree for Samsung Galaxy S5 Active (NTT docomo SC-02G / kltedcmactive)

TeamWin Recovery Project (TWRP) 3.7+ custom recovery device tree for **Samsung Galaxy S5 Active (SC-02G)** powered by Qualcomm Snapdragon 801 (MSM8974PRO-AC).

---

## 📱 Device Specifications

| Feature | Specification |
|:---|:---|
| **Device** | Samsung Galaxy S5 Active (NTT docomo) |
| **Model** | SC-02G |
| **Codename** | `kltedcmactive` |
| **SoC** | Qualcomm MSM8974PRO-AC Snapdragon 801 (2.5 GHz Quad-Core) |
| **GPU** | Adreno 330 |
| **Display** | 1080 x 1920 Super AMOLED (480 dpi) |
| **Storage / RAM** | 16 GB eMMC 5.0 / 2 GB LPDDR3 |
| **Recovery Partition** | 16 MB (`/dev/block/platform/msm_sdcc.1/by-name/recovery`) |
| **System Partition** | 2.39 GB (2,390 MB) |
| **TWRP Version** | TWRP 3.7.1+ (Android 9.0 / 8.1 Omni base) |
| **Language** | 日本語 (Japanese) デフォルト対応 |

---

## 🚀 How to Build TWRP 3.7+ for SC-02G

### 1. Initialize TWRP Minimal Manifest
```bash
mkdir -p ~/twrp-9.0 && cd ~/twrp-9.0
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0
```

### 2. Clone SC-02G Recovery Device Tree
```bash
mkdir -p device/samsung
git clone https://github.com/manat414-dev-jp/android_device_samsung_kltedcmactive.git -b twrp-3.7 device/samsung/kltedcmactive
```

### 3. Sync Repositories
```bash
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

### 4. Build Recovery Image
```bash
source build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
lunch twrp_kltedcmactive-eng
# または lunch omni_kltedcmactive-eng
mka recoveryimage -j$(nproc --all)
```

---

## 📦 Output Files
After successful build, find the output files at:
- **Recovery Image**: `out/target/product/kltedcmactive/recovery.img`
- **Tar archive for Odin**: `tar -H ustar -c recovery.img > twrp-3.7.1-SC-02G.tar.md5`

---

## ⚡ How to Flash onto SC-02G

### Method 1: Via Heimdall (Linux / macOS)
```bash
# 1. Boot SC-02G into Download Mode (Vol Down + Home + Power)
# 2. Flash recovery
heimdall flash --RECOVERY recovery.img --no-reboot
```

### Method 2: Via Existing TWRP (Flash Image)
1. Copy `recovery.img` to MicroSD or Internal Storage.
2. In TWRP, go to **Install > Install Image**, select `recovery.img`, choose **Recovery** partition, and swipe to flash.

### Method 3: Via Odin (Windows PC)
1. Boot SC-02G into Download Mode (Vol Down + Home + Power).
2. Connect to PC via USB, open Odin, select `twrp-3.7.1-SC-02G.tar.md5` in the **AP** slot, and click **Start**.
