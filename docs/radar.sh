#!/bin/bash
if [ -z $1 ]
then
    echo "Please specify solution"
else
    echo "Generating radar for $1"
    Rscript run.R $1
    filename="$(echo $1 | tr '[:upper:]' '[:lower:]').html"
    mv default.html $filename
    open $filename
fi
