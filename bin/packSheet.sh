#!/bin/bash
printf "Testing dependencies:\n"
which optipng diff texturepacker magick
printf "\n\n"

imageName=$1
dirName=${imageName%.png}

printf "Splitting from \nFrom: %s\nTo %s\n\n" $imageName $dirName
read -p "Press enter to continue..."

mkdir $dirName
magick convert $imageName -crop 32x32 $dirName/tile.png

mv $imageName ${imageName}_old

packSprites $dirName