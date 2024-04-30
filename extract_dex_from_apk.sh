#!/bin/bash


output_dir_decom=./decom_apks

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path-to-apk-file>"
    exit 1
fi

APK_FILE=$1
DEX_DIR=$(basename "$APK_FILE" .apk)

apktool d "$APK_FILE" -o "$DEX_DIR"

if [ $? -ne 0 ]; then
    echo "Error: apktool failed to extract dex from $APK_FILE"
    exit 1
fi

echo "Extracted dex files from $APK_FILE to $DEX_DIR"

mv $DEX_DIR $output_dir_decom/$APK_FILE

