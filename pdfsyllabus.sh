#!/bin/sh
OUTFILE=printable/syllabus.pdf
INPUT=printable/syllabus.md

PANDOC=`which pandoc`

JULIA=`which julia`
echo Using $PANDOC and $JULIA

$JULIA composite.jl
echo "Created composite file. Now running pandoc."

$PANDOC $INPUT --from markdown -o $OUTFILE --pdf-engine=tectonic --template eisvogel -V paper:letter  -V classoption=oneside  -V 'sansfont:Brill' -V 'mainfont:Brill'

