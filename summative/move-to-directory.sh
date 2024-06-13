#!/bin/bash

DIRECTORY_NAME="negpod_5-q1"
FILES=("main.sh" "students-list_1023.txt" "select-emails.sh" "student-emails.txt")

# Create the directory if it doesn't exist
mkdir -p "$DIRECTORY_NAME"

# Move files to the directory
for file in "${FILES[@]}"; do
    mv "$file" "$DIRECTORY_NAME/"
done

echo "Files moved to $DIRECTORY_NAME directory."

