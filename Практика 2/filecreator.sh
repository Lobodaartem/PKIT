#!/bin/bash

read -p "Введіть ваше ім'я: " yourName

lastFileNumber=$(ls -1 "${yourName}"* 2>/dev/null | grep -Eo '[0-9]+' | sort -nr | head -n 1)
if [ -z "$lastFileNumber" ]; then
    lastFileNumber=0
fi

fileCount=25

for ((i = 1; i <= fileCount; i++)); do
    fileNumber=$((lastFileNumber + i))
    fileName="${yourName}${fileNumber}"
    touch "$fileName"
    echo "Створено файл: $fileName"
done

echo "Успішно створено $fileCount файлів."
