#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Output file is required"
    exit 1
fi

outputFile="$1"
>"$outputFile"

ls -lR / 2>/dev/null | grep -E '^[-]' -m 1 | awk '{print $1, $NF}' >> "$outputFile"
ls -lR / 2>/dev/null | grep -E '^[b]' -m 1 | awk '{print $1, $NF}' >> "$outputFile"
ls -lR / 2>/dev/null | grep -E '^[c]' -m 1 | awk '{print $1, $NF}' >> "$outputFile"
ls -lR / 2>/dev/null | grep -E '^[d]' -m 1 | awk '{print $1, $NF}' >> "$outputFile"
ls -lR / 2>/dev/null | grep -E '^[l]' -m 1 | awk '{print $1, $NF}' >> "$outputFile"
ls -lR / 2>/dev/null | grep -E '^[p]' -m 1 | awk '{print $1, $NF}' >> "$outputFile"
ls -lR / 2>/dev/null | grep -E '^[s]' -m 1 | awk '{print $1, $NF}' >> "$outputFile"