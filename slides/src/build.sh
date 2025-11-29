#!/bin/bash

echo "Building ..."
cmd=$(pdflatex "\def\chap{$1}\input{main.tex}")
echo "Done ..."
