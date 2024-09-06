$IN_DIR = "C:\Users\annammc\OneDrive - Universitetet i Oslo\Documents\GitHub\images\test\"
$EXT = "*.jpg"
$LOGO_DIR = "C:\Users\annammc\OneDrive - Universitetet i Oslo\Documents\GitHub\images\logoV2.png"
$OUT_DIR = "C:\Users\annammc\OneDrive - Universitetet i Oslo\Documents\GitHub\marios-realestate.gr\assets\images\test"
$LOGO_SIZE = "700,700" #for house1,4= 700, house2 = 200, house3 + 4 + 5 = 400, house 6 = 700
# $PREFIX="h1"

Write-Output "Watermarking images..."
mkdir $OUT_DIR\watermark -ea 0
magick.exe mogrify -auto-orient -gravity center -geometry +0+0 -draw "image Over 0,0 $LOGO_SIZE '$LOGO_DIR'"  -path $OUT_DIR/watermark/ $IN_DIR\$EXT
# magick.exe convert  $IN_DIR\$EXT -auto-orient -gravity center -geometry +0+0 -draw "image Over 0,0 700,700 '$LOGO_DIR'"  $OUT_DIR/watermark/$PREFIX'_wm_%02d.jpg'
Write-Output "...done!`r`n"

Write-Output "Resizing images..."
mkdir $OUT_DIR\resized -ea 0
magick.exe mogrify $IN_DIR\$EXT -resize 10% -path $OUT_DIR/resized/ $IN_DIR\$EXT
# magick.exe convert $IN_DIR\$EXT-resize 10% $OUT_DIR/resized/$PREFIX'_lr_%02d.jpg'
Write-Output "...done!"