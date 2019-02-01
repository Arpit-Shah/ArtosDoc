@echo off
call ./make.bat clean
call ./make.bat latex
mkdir ./build/pdf
cd ./build/latex/
start pdflatex ./Artos.tex -output-directory=./../pdf/
pause