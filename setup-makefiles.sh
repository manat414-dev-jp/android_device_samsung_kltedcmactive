#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=kltedcmactive
DEVICE_COMMON=klte-common
VENDOR=samsung

INITIAL_COPYRIGHT_YEAR=2016

# Load extract_utils and execute setup
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

ANDROID_ROOT="$MY_DIR/../../.."

# If common tree exists, delegate to klte-common setup-makefiles
if [ -f "$MY_DIR/../../$VENDOR/$DEVICE_COMMON/setup-makefiles.sh" ]; then
    export DEVICE
    export DEVICE_COMMON
    export VENDOR
    "$MY_DIR/../../$VENDOR/$DEVICE_COMMON/setup-makefiles.sh" "$@"
    exit 0
fi

# Fallback standalone setup
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

# Write headers and build files for vendor repository
write_headers
write_makefiles "$MY_DIR/proprietary-files.txt" true
write_footers
