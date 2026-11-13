#!/bin/bash

set -e  # Exit immediately if any command fails

VOLUME_PATH="/Volumes/<-TODO: Add folder name here->"
SOURCE_DIR="$VOLUME_PATH/TempExports/2024"
DEST_DIR="$VOLUME_PATH/Organized/2024"

echo "Starting organizing files from:"
echo "  Source:      $SOURCE_DIR"
echo "  Destination: $DEST_DIR"
echo

find "$SOURCE_DIR" -type f \( -iname "*.jpg" -o -iname "*.heic" -o -iname "*.png" -o -iname "*.mov" -o -iname "*.xmp" \) | while read -r FILE; do
  BASENAME=$(basename "$FILE")

  # Extract creation date from file (fall back to modification date)
  DATE=$(exiftool -d "%Y/%m" -CreateDate -S -s "$FILE" 2>/dev/null | head -n1)
  if [[ -z "$DATE" ]]; then
    DATE=$(date -r "$FILE" "+%Y/%m")
  fi

  TARGET_DIR="$DEST_DIR/$DATE"

  echo "Creating directory: $TARGET_DIR"
  mkdir -p "$TARGET_DIR"

  echo "Copying file: $BASENAME to $TARGET_DIR/"
  cp -n "$FILE" "$TARGET_DIR/"

  echo
done

echo "✅ All files organized successfully."
