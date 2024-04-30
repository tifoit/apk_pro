#!/bin/bash

SOURCE_CODE_DIR="./apks_dex"

KEYWORDS=("NN" "DL" "ML")
#KEYWORDS=("tensor")

find "$SOURCE_CODE_DIR" -type d -name 'out_*' | while read -r out_folder; do
    source_code_dir="$out_folder/sourceCode"
    if [ -d "$source_code_dir" ]; then
        find "$source_code_dir" -type f | while read -r file; do
            filename=$(basename "$file")
            for keyword in "${KEYWORDS[@]}"; do
                if [[ $filename == *"$keyword"* ]]; then
                    echo "找到文件: $file"
                fi
            done
        done
    else
        echo "sourceCode目录不存在: $source_code_dir"
    fi
done

echo "完成。"

