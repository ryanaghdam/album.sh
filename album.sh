#!/bin/bash

# Size of the thumbnail images
ALBUM_THUMB_SIZE=${ALBUM_THUMB_SIZE:=200}

# Output file
ALBUM_OUTPUT_FILE=${ALBUM_OUTPUT_FILE:=index.html}

# create_thumbnail
#
# Creates a square thumbnail for the given image.  The thumbnail will be output
# to the thumbs directory.
#
# The size of the created thumbnail is defined in the ALBUM_THUMB_SIZE
# environemtn variable.  If it is not defined, the default value is 200 pixels.
function create_thumbnail {
  mkdir -p thumbs
  convert $1 \
    -thumbnail ${ALBUM_THUMB_SIZE}x${ALBUM_THUMB_SIZE}^ \
    -gravity center \
    -extent ${ALBUM_THUMB_SIZE}x${ALBUM_THUMB_SIZE} \
    thumbs/$1
}

cat <<EOF > $ALBUM_OUTPUT_FILE
<!DOCTYPE html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<main>
EOF

for IMAGE in $@; do
  create_thumbnail $IMAGE
  echo "<a href=$IMAGE><img src=thumbs/$IMAGE></a>" >> $ALBUM_OUTPUT_FILE
done

echo "</main>" >> $ALBUM_OUTPUT_FILE
