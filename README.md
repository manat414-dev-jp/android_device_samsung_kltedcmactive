# Device Tree for Samsung Galaxy S5 Active NTT Docomo (SC-02G / kltedcmactive)

LineageOS 15.1 (Android 8.1 Oreo) device configuration tree for the **Samsung Galaxy S5 Active (NTT Docomo SC-02G)**.

## Specifications
- **Chipset**: Qualcomm MSM8974PRO-AC Snapdragon 801
- **CPU**: Quad-core 2.5 GHz Krait 400
- **GPU**: Adreno 330
- **RAM**: 2 GB
- **Storage**: 16 GB (NTT Docomo partition table)
- **Display**: 1080 x 1920 pixels, 5.1 inches Super AMOLED
- **Hardware Keys**: Physical Home, Back, AppSwitch buttons + Dedicated Active Key (hot_key, GPIO 144, Linux scancode 252)
- **NFC / FeliCa**: Sony CXD224x
- **Fingerprint**: Not present (Rugged model design)
- **Stock Base**: Android 6.0.1 Marshmallow (Docomo firmware SC02GOMU2CQB1)

## Marshmallow BLOBs on Oreo 8.1 Compatibility Notes
- **GPS Stack**: `libloc_ds_api.so` (legacy Qualcomm Data Service API) is explicitly excluded since it is removed from Marshmallow and Oreo GPS stacks. Marshmallow `libloc_api_v02.so` is utilized.
- **RIL Shim**: Marshmallow `libsec-ril.so` requires `cutils/atomic` and `IPCThreadState` symbols; resolved via `libshim_cutils_atomic` and `libshim_ril`.
- **Camera Shim**: `camera.vendor.msm8974.so` requires RT-HDR and Phase-AF symbols; resolved via `libshim_camera`.
- **Text Relocations**: `TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true` is enabled in `BoardConfig.mk`.

## Proprietary Blobs Extraction
To extract proprietary blobs from your local Marshmallow stock firmware dump without downloading external vendor repos:

```bash
# In the device/samsung/kltedcmactive directory:
./extract-files.sh /path/to/extracted/stock_rom/system
```

Or from a connected device with ADB enabled:
```bash
./extract-files.sh
```

## How to Build
```bash
. build/envsetup.sh
lunch lineage_kltedcmactive-userdebug
brunch kltedcmactive
```
