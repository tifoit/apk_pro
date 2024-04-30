#!/bin/bash

DEX_DIR="./apks_dex"

# find "$DEX_DIR" -type d -name 'out_*' |xargs grep 
find "$DEX_DIR" -type d -name 'out_*' | while read -r dex_folder; do
    apk_name=$(basename "$dex_folder" | sed 's/out_//')
    # source_code_dir="$dex_folder"
    source_code_dir="$dex_folder/sourceCode"
    mkdir -p "$source_code_dir"
    
    find "$dex_folder" -type f -name '*.dex' | while read -r dex_file; do
        echo "Starting: $dex_file"
        jadx -d "$source_code_dir" "$dex_file"
    done
done

echo "操作已完成。"


