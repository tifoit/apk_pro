#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path-to-dex-file>"
    exit 1
fi

DEX_FILE=$1
OUTPUT_DIR=$(basename "$DEX_FILE" .dex)

# jd-cli "$DEX_FILE" -d "$OUTPUT_DIR"
jadx "$DEX_FILE" -d "$OUTPUT_DIR"

if [ $? -ne 0 ]; then
    echo "Error: jadx failed to decompile $DEX_FILE"
    exit 1
fi

echo "OK! $DEX_FILE to $OUTPUT_DIR"

