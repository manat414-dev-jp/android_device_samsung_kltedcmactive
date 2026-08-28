#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=kltedcmactive
VENDOR=samsung

# Load extract_utils and execute dump
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

ANDROID_ROOT="$MY_DIR/../../.."

# Look for LineageOS 15.1 extract_utils location first, then fallback to others
if [ -f "$ANDROID_ROOT/vendor/lineage/build/tools/extract_utils.sh" ]; then
    HELPER="$ANDROID_ROOT/vendor/lineage/build/tools/extract_utils.sh"
elif [ -f "$ANDROID_ROOT/tools/extract-utils/extract_utils.sh" ]; then
    HELPER="$ANDROID_ROOT/tools/extract-utils/extract_utils.sh"
elif [ -f "$LINEAGE_ROOT/vendor/lineage/build/tools/extract_utils.sh" ]; then
    HELPER="$LINEAGE_ROOT/vendor/lineage/build/tools/extract_utils.sh"
else
    echo "Unable to find helper script at $ANDROID_ROOT/vendor/lineage/build/tools/extract_utils.sh"
    exit 1
fi
source "$HELPER"

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$ANDROID_ROOT"

# Extract files from ADB or source folder
extract "$MY_DIR/proprietary-files.txt" "$SRC"

"$MY_DIR/setup-makefiles.sh"
