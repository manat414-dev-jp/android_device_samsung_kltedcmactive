# Device Tree for Samsung Galaxy S5 Active (SC-02G / kltedcmactive)

## Specifications
- **Device**: Samsung Galaxy S5 Active (NTT DOCOMO SC-02G)
- **SoC**: Qualcomm Snapdragon 801 (MSM8974PRO-AC)
- **CPU**: Quad-core 2.5 GHz Krait 400
- **GPU**: Adreno 330
- **RAM**: 2 GB LPDDR3
- **Storage**: 16 GB eMMC 5.0
- **Battery**: 2800 mAh Li-Ion
- **Display**: 1080 x 1920 pixels, 5.1 inches Super AMOLED
- **Camera**: 16 MP rear, 2.1 MP front
- **Physical Keys**: Home, Back, AppSwitch/Menu + Side Active Key (GPIO 144)
- **Target OS**: crDroid 8.x (Android 12.1 / LineageOS 19.1 base)
- **Maintainer**: manat414-dev-jp

## Branch Layout
- `12.1` : Main stable branch
- `12.1-sc02g-bringup` : Bringup & development branch

## Build Instructions (WSL2 Ubuntu)
```bash
# Set up environment
source build/envsetup.sh

# Lunch target
lunch crdroid_kltedcmactive-userdebug

# Build
mka bacon -j$(nproc)
```
