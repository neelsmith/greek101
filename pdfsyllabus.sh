#!/bin/sh

PANDOC=`which pandoc`

JULIA=`which julia`
echo Using $PANDOC and $JULIA

$JULIA composite.jl
echo "Created composite file. Now running pandoc."

$PANDOC syllabus.md --from markdown -o syllabus.pdf --pdf-engine=tectonic -V paper:letter  -V classoption=oneside 

