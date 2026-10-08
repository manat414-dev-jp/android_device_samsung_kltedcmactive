#!/bin/bash
# ==============================================================================
# SC-02G (kltedcmactive) crDroid 8.x (Android 12.1) WSL2 環境セットアップスクリプト
# ==============================================================================
set -e

CRDROID_ROOT="${1:-$HOME/crdroid}"

echo "=================================================="
echo " 1. crDroid ソースツリーパス確認: ${CRDROID_ROOT}"
echo "=================================================="

if [ ! -d "${CRDROID_ROOT}/.repo" ]; then
    echo "[!] エラー: ${CRDROID_ROOT} に .repo ディレクトリが見つかりません。"
    echo "    引数に crDroid のルートディレクトリを指定して再実行してください。"
    echo "    使用例: ./setup_wsl2_tree.sh ~/crdroid"
    exit 1
fi

echo "=================================================="
echo " 2. local_manifests (roomservice.xml) の配置確認"
echo "=================================================="

MANIFEST_DIR="${CRDROID_ROOT}/.repo/local_manifests"
mkdir -p "${MANIFEST_DIR}"

cat << 'EOF' > "${MANIFEST_DIR}/roomservice.xml"
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <remote name="khalvat" fetch="https://github.com/Khalvat-M" revision="12.1" />
  <remote name="crdroid" fetch="https://github.com/crdroidandroid" revision="12.1" />

  <!-- crDroid Hardware -->
  <project name="android_hardware_samsung" path="hardware/samsung" remote="crdroid" />
  <project name="android_hardware_sony_timekeep" path="hardware/sony/timekeep" remote="crdroid" />

  <!-- Device -->
  <project name="device_samsung_klte" path="device/samsung/klte" remote="khalvat" />
  <project name="device_samsung_msm8974-common" path="device/samsung/msm8974-common" remote="khalvat" />

  <!-- Kernel -->
  <project name="kernel_samsung_msm8974" path="kernel/samsung/msm8974" remote="khalvat" />
</manifest>
EOF

echo "[+] ${MANIFEST_DIR}/roomservice.xml を配置しました。"

echo "=================================================="
echo " 3. repo sync 後のツリー配置確認"
echo "=================================================="

CHECK_DIRS=(
    "hardware/samsung"
    "hardware/sony/timekeep"
    "device/samsung/klte"
    "device/samsung/msm8974-common"
    "kernel/samsung/msm8974"
)

MISSING=0
for d in "${CHECK_DIRS[@]}"; do
    if [ -d "${CRDROID_ROOT}/${d}" ]; then
        echo "  [OK] ${d}"
    else
        echo "  [MISSING] ${d} (repo sync が必要です)"
        MISSING=1
    fi
done

if [ ${MISSING} -eq 1 ]; then
    echo ""
    echo "[!] 必要なリポジトリがまだ同期されていません。"
    echo "    以下のコマンドを実行して同期してください:"
    echo "    cd ${CRDROID_ROOT} && repo sync --force-sync --no-clone-bundle --current-branch -j\$(nproc)"
fi

echo "=================================================="
echo " 4. device/samsung/kltedcmactive のリンク / 配置"
echo "=================================================="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DEVICE_DIR="${CRDROID_ROOT}/device/samsung/kltedcmactive"

mkdir -p "${CRDROID_ROOT}/device/samsung"

if [ -L "${TARGET_DEVICE_DIR}" ] || [ -d "${TARGET_DEVICE_DIR}" ]; then
    echo "[i] 既存の ${TARGET_DEVICE_DIR} を確認しました。"
else
    echo "[+] シンボリックリンクを作成します: ${SCRIPT_DIR} -> ${TARGET_DEVICE_DIR}"
    ln -s "${SCRIPT_DIR}" "${TARGET_DEVICE_DIR}"
fi

echo "=================================================="
echo " 5. vendor/samsung の設定確認"
echo "=================================================="

echo "Makefile では以下の安全ガードが適用されているため、"
echo "Vendor 未配置でも構文エラー（lunch失敗）は発生しません:"
echo "  - BoardConfig.mk: -include vendor/samsung/kltedcmactive/BoardConfigVendor.mk"
echo "  - kltedcmactive.mk: \$(call inherit-product-if-exists, vendor/samsung/kltedcmactive/kltedcmactive-vendor.mk)"

if [ -d "${CRDROID_ROOT}/vendor/samsung/kltedcmactive" ]; then
    echo "[OK] vendor/samsung/kltedcmactive が配置されています。"
else
    echo "[NOTICE] vendor/samsung/kltedcmactive は未配置です。"
fi

echo "=================================================="
echo " 6. lunch 環境検証の実行準備"
echo "=================================================="
echo "以下のコマンドで lunch ターゲットが認識されるか確認できます:"
echo "  cd ${CRDROID_ROOT}"
echo "  source build/envsetup.sh"
echo "  lunch crdroid_kltedcmactive-userdebug"
echo "=================================================="
