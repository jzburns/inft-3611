#!/bin/bash

echo "Building ..."
pdflatex "\def\chap{$1}\input{main.tex}"
echo "Done ..."
