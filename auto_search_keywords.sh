#!/bin/bash

SOURCE_CODE_DIR="./apks_dex"

KEYWORDS=("import")

find "$SOURCE_CODE_DIR" -type d -name 'out_*' -prune | while read -r out_folder; do
    source_code_dir="$out_folder/sourceCode"
    if [ -d "$source_code_dir" ]; then
        find "$source_code_dir" -type f | while read -r file; do
            for keyword in "${KEYWORDS[@]}"; do
                if [[ $(basename "$file" | tr '[:upper:]' '[:lower:]') == *"$keyword"* ]]; then
                    echo "找到文件: $file"
                    grep -i "$keyword" "$file" && echo "----------------------------------------" || echo "文件 $file 没有包含关键字的行。"
                fi
            done
        done
    else
        echo "sourceCode目录不存在: $source_code_dir"
    fi
done

echo "完成。"

