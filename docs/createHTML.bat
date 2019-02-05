@echo off
call ./make.bat clean
call ./make.bat html
start ./build/html/index.html
pause