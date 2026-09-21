#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
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

set -e

DEVICE=kltedcmactive
VENDOR=samsung

# Load extract_utils and do sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

ANDROID_ROOT="$MY_DIR"/../../..

HELPER="$ANDROID_ROOT"/vendor/lineage/build/tools/extract_utils.sh
if [ -f "$HELPER" ]; then
    . "$HELPER"

    if [ $# -eq 0 ]; then
        SRC=adb
    else
        if [ $# -eq 1 ]; then
            SRC=$1
        else
            echo "$0: bad number of arguments"
            echo ""
            echo "usage: $0 [PATH_TO_EXPANDED_STOCK_ROM]"
            echo ""
            echo "If PATH_TO_EXPANDED_STOCK_ROM is not specified, blobs will be extracted from"
            echo "the device using adb pull."
            exit 1
        fi
    fi

    setup_vendor "$DEVICE" "$VENDOR" "$ANDROID_ROOT"
    extract "$MY_DIR"/proprietary-files.txt "$SRC"

    "$MY_DIR"/setup-makefiles.sh
else
    # Standalone extraction mode (when running outside full LineageOS tree)
    echo "[*] Running in standalone extraction mode..."

    SRC="$1"
    TARGET_DIR="$ANDROID_ROOT/vendor/$VENDOR/$DEVICE/proprietary"
    if [ -z "$SRC" ]; then
        echo "[!] No source directory specified. Usage: $0 <path_to_extracted_stock_system>"
        echo "[!] Example: $0 /path/to/SC02G_Marshmallow_System_Dump"
        exit 1
    fi

    if [ ! -d "$SRC" ]; then
        echo "[-] Error: Source directory '$SRC' does not exist."
        exit 1
    fi

    echo "[+] Extracting proprietary blobs from: $SRC"
    mkdir -p "$TARGET_DIR"

    while IFS= read -r line || [ -n "$line" ]; do
        # Ignore comments and empty lines
        line=$(echo "$line" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
        [[ "$line" =~ ^#.*$ ]] && continue
        [[ -z "$line" ]] && continue

        # Handle split syntax: src:dst|hash or src:dst or src|hash or plain src
        clean_entry="${line%%|*}"
        if [[ "$clean_entry" == *":"* ]]; then
            src_file="${clean_entry%%:*}"
            dst_file="${clean_entry##*:}"
        else
            src_file="$clean_entry"
            dst_file="$clean_entry"
        fi

        # Remove leading - if present (pinning or non-fatal)
        src_file="${src_file#-}"
        dst_file="${dst_file#-}"

        # Resolve source path
        if [ -f "$SRC/$src_file" ]; then
            SOURCE_FILE="$SRC/$src_file"
        elif [ -f "$SRC/system/$src_file" ]; then
            SOURCE_FILE="$SRC/system/$src_file"
        else
            echo "[-] Warning: File not found: $src_file"
            continue
        fi

        DEST_FILE="$TARGET_DIR/$dst_file"
        mkdir -p "$(dirname "$DEST_FILE")"
        cp "$SOURCE_FILE" "$DEST_FILE"
        echo "[+] Copied: $dst_file"
    done < "$MY_DIR"/proprietary-files.txt

    "$MY_DIR"/setup-makefiles.sh
    echo "[+] Extraction completed successfully."
fi
