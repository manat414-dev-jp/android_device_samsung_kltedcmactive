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

HELPER="$ANDROID_ROOT/tools/extract-utils/extract_utils.sh"
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
source "$HELPER"

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$ANDROID_ROOT"

# Extract files from ADB or source folder
extract "$MY_DIR/proprietary-files.txt" "$SRC"

"$MY_DIR/setup-makefiles.sh"
