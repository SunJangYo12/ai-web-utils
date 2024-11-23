#!/bin/bash

output_file="NewListen_4.txt"

check_files=(
"$output_file"
"/var/www/html/ai-web/musiktxt/NewListen_1.txt"
"/var/www/html/ai-web/musiktxt/NewListen_2.txt"
"/var/www/html/ai-web/musiktxt/NewListen_3.txt")

touch "$output_file"

while true; do
    echo -n "Music inputs: "
    read input_text

    # Flag untuk melacak apakah string ditemukan
    found=false

    # Periksa apakah string ada di salah satu file dalam daftar
    for file in "${check_files[@]}"; do
        if [[ -f "$file" ]] && grep -qxF "$input_text" "$file"; then
            found=true
            echo
            echo "Exists in $file. not added"
            echo
            break
        fi
    done

    # Jika string tidak ditemukan, tambahkan ke file output
    if [ "$found" = false ]; then
        echo "$input_text" >> "$output_file"
        echo
        echo "Added"
        echo
    fi
done
