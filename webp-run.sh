#!/bin/bash

# Set the input and output directories
input_directory="."
output_directory="webp"

# Create the output directory if it doesn't exist
mkdir -p "$output_directory"

# Loop through all image files in the input directory
for img_file in "$input_directory"/*.{jpg,jpeg,png,gif,tiff,bmp}; do
    if [ -f "$img_file" ]; then
        # Get the filename without extension
        filename=$(basename -- "$img_file")
        filename_no_ext="${filename%.*}"

        # Convert the image to WebP using cwebp
        brew install webp
        cwebp -q 90 -resize 400 0 "$img_file" -o "$output_directory/$filename_no_ext.webp"
    fi
done
