@echo off
call ./make.bat clean
call ./make.bat latex
mkdir ./build/pdf
cd ./build/latex/
start pdflatex ./Artos.tex -output-directory=./../pdf/
pause
@echo Compile it twice otherwise it does not generate table of content
start pdflatex ./Artos.tex -output-directory=./../pdf/

pause

ping 127.0.0.1 -n 6 > nul

start ../pdf/Artos.pdf
pause