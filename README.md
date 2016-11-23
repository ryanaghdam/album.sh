album.sh
========

Requirements
------------

- Bash
- Imagemagick


Usage
-----

Create an album with specific images:

    ./album.sh img1.jpg img2.jpg


Create an album with all jpgs in the directory:

    ./album.sh *.jpg


Write to cars.html (intead of index.html):

    ALBUM_OUTPUT_FILE=cars.html ./album.sh miata.jpg frs.jpg mazda6.jpg


Use 50px square thumbnails (instead of 200px):

    ALBUM_THUMB_SIZE=50 ./album.sh *.jpg
