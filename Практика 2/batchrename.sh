#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <directory> <original_extension> <new_extension>"
    exit 1
fi

directory="$1"
original_extension="$2"
new_extension="$3"

find "$directory" -type f -name "*.$original_extension" | while read -r file; do
    filename=$(basename "$file" ".$original_extension")
    new_filename="$filename.$new_extension"
    mv "$file" "$directory/$new_filename"
    echo "Переіменовую $directory/$file на $directory/$new_filename"
done
