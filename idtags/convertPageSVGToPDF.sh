#!/bin/bash
for i in page*.svg; do 
    inkscape $i -w 2480 -h 3507 -e ${i/svg/png}
done
convert -adjoin page*.png idcards.pdf
#pdftk certificates.pdf dump_data output metadata.txt
pdftk idcards.pdf update_info metadata.txt output python101_identifications.pdf