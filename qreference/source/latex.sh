#!/bin/bash

S=~/q/dev/q/reference
P=~/tempref
U=~/uni/tmp

mkdir -p $P
cd $P
pdfname=$P/ref.pdf
rm -rf $pdfname
sleep 0.1
pdflatex $S/ref.tex
if [ -f $pdfname ]; then
 cp $pdfname $U/ref.pdf
 evince $pdfname &
else
 echo "notfound"
fi

