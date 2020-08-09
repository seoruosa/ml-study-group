#!/bin/bash

DOWNLOAD_PATH="data/raw"
OUTPUT_PATH="data/extracted"
TEMP="${OUTPUT_PATH}/temp"

DATASETNAME="FordA"
TYPES="TEST TRAIN"
INPUTFORMAT="txt"

url="http://www.timeseriesclassification.com/Downloads/${DATASETNAME}.zip"

mkdir -p "$DOWNLOAD_PATH" "$OUTPUT_PATH" "$TEMP" 

# Download dataset
wget -O "${DOWNLOAD_PATH}/${DATASETNAME}.zip" -c -t 0 "$url"

unzip "${DOWNLOAD_PATH}/${DATASETNAME}.zip" -d "$TEMP"

for type in $TYPES; do
    EXTRACT_FILE_PATH="${TEMP}/${DATASETNAME}_${type}.${INPUTFORMAT}"
    EXTRACTED_FILE_PATH="${OUTPUT_PATH}/${DATASETNAME}_${type}.csv"

    echo $EXTRACT_FILE_PATH

    python src/extract.py "$EXTRACT_FILE_PATH" "$EXTRACTED_FILE_PATH"
    gzip "$EXTRACTED_FILE_PATH"
done

rm -Rf "$TEMP"