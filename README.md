# LineageOS 15.1 Device Tree for Samsung Galaxy S5 Active (Docomo SC-02G / kltedcmactive)

## Specifications
- **Device**: Samsung Galaxy S5 Active (NTT Docomo)
- **Model**: SC-02G
- **Codename**: `kltedcmactive` / `klteactive` / `klte`
- **SoC**: Qualcomm Snapdragon 801 (MSM8974PRO-AC)
- **Chipset ID**: `0xC2085101`, Platform: `2` (Board Rev 0.2)
- **Screen**: 1080x1920 Full HD AMOLED
- **ROM Target**: LineageOS 15.1 (Android 8.1 Oreo)

---

## How to Build LineageOS 15.1 (Android 8.1)

### 1. Initialize LineageOS 15.1 Source Tree (WSL2 Native Linux)
```bash
mkdir -p ~/android/lineage-15.1 && cd ~/android/lineage-15.1
repo init -u https://github.com/LineageOS/android.git -b lineage-15.1 --depth=1
```

### 2. Configure Local Manifest (`.repo/local_manifests/klte.xml`)
```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
    <!-- SC-02G Device Tree -->
    <project name="manat414-dev-jp/android_device_samsung_kltedcmactive" path="device/samsung/kltedcmactive" remote="github" revision="lineage-15.1" />

    <!-- Samsung Common Device Trees (Open Source) -->
    <project name="LineageOS/android_device_samsung_klte-common" path="device/samsung/klte-common" remote="github" revision="lineage-15.1" />
    <project name="LineageOS/android_device_samsung_msm8974-common" path="device/samsung/msm8974-common" remote="github" revision="lineage-15.1" />
    <project name="LineageOS/android_device_samsung_qcom-common" path="device/samsung/qcom-common" remote="github" revision="lineage-15.1" />

    <!-- Samsung MSM8974 Kernel (Open Source) -->
    <project name="LineageOS/android_kernel_samsung_msm8974" path="kernel/samsung/msm8974" remote="github" revision="lineage-15.1" />

    <!-- Samsung Hardware HAL (Open Source) -->
    <project name="LineageOS/android_hardware_samsung" path="hardware/samsung" remote="github" revision="lineage-15.1" />

    <!-- Samsung Device Settings Resources (Open Source) -->
    <project name="LineageOS/android_packages_resources_devicesettings" path="packages/resources/devicesettings" remote="github" revision="lineage-15.1" />
</manifest>
```

### 3. Sync Source Code
```bash
repo sync -c -j$(nproc) --no-clone-bundle --no-tags --force-sync
```

### 4. Extract Proprietary Blobs from Device or Local Stock Dump
Do NOT download vendor files from public repositories. Extract directly from SC-02G device or local stock Marshmallow dump:
```bash
# Connect device with ADB enabled, or specify path to expanded stock ROM:
cd device/samsung/kltedcmactive
./extract-files.sh /path/to/extracted_stock_system
```

### 5. Build ROM
```bash
export LC_ALL=C
export ANDROID_COMPILE_WITH_JACK=false

source build/envsetup.sh
lunch lineage_kltedcmactive-userdebug
mka bacon -j$(nproc)
```

### 6. Output
- `out/target/product/kltedcmactive/lineage-15.1-*-UNOFFICIAL-kltedcmactive.zip`
- `out/target/product/kltedcmactive/boot.img`
