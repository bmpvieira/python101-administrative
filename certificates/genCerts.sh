#!/bin/bash
while read line; do
	sed -e "s/First Last/$line/" certificate.svg > "py101Cert_${line/ /_}.svg"
	inkscape "py101Cert_${line/ /_}.svg" -w 2480 -h 3507 -e "py101Cert_${line/ /_}.png"
done < participants.txt
convert -adjoin *png py101Certs.pdf
#pdftk certificates.pdf dump_data output metadata.txt
pdftk py101Certs.pdf update_info metadata.txt output python101_certificates.pdf