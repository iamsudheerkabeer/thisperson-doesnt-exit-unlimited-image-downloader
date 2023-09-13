#!/bin/bash

# Image downloader by Sudheer Kabeer
# Created by Sudheer Kabeer
# Website: https://sudheer.xyz
# GitHub: https://github.com/iamsudheerkabeer

# Configuration
max=2
url="https://www.thispersondoesnotexist.com/"
imgdir="images"

created_by="Sudheer Kabeer"
learn_with="https://sudheer.xyz"

printf "This script is created by $created_by\n"

# Social Profiles
printf "My Social Profiles:\n"
printf "Youtube: https://youtube.com/iamsudheerkabeer\n"
printf "Instagram: https://instagram.com/iamsudheerkabeer\n"
printf "Facebook: https://facebook.com/iamsudheerkabeer\n"
printf "Github: https://github.com/iamsudheerkabeer\n"

printf "\nDownloading $max images\n"

# Create the images directory if it doesn't exist
mkdir -p "$imgdir"
cd "$imgdir"

# Loop to download images $max number of times
count=1
while [ $count -le $max ]
do
    filename="image$count.jpg"
    if [ ! -f "$filename" ]; then
        wget -q "$url" -O "$filename"

        # Use ImageMagick's convert to add text to the image
        convert "$filename" -pointsize 24 -fill white -annotate +50+50 "Created by $created_by" -annotate +50+100 "Learn with $learn_with" "$filename"

        # Add EXIF data using exiftool
        exiftool -Title="Created by $created_by" -Description="Learn with $learn_with" "$filename"

        printf "\r%2d Completed" $count
    else
        printf "\r%2d Skipped (File already exists)" $count
    fi
    ((count++))
done

# Complete!
printf "\nDownloads complete! All images saved to $imgdir/\n"
