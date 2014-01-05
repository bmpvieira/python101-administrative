#!/bin/bash
template="idtags_unlinkedClones.svg"
pageCounter=1
output="page$pageCounter.svg"
cp $template $output
nameCounter=0
while read line; do
    sed -i -e "0,/First Last/s/First Last/$line/" $output
    nameCounter=$((nameCounter+1))
    if [[ $nameCounter -eq 9 ]]; then
        pageCounter=$((pageCounter+1))
        output="page$pageCounter.svg"
        cp $template $output
        nameCounter=0
    fi
done < users.txt