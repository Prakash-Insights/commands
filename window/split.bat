::TESTED
@echo off
mkdir %2
::split.bat "D:\images" "D:\test"
::dir %1 /b /s /A:-D >tempfilelist.txt

setlocal enabledelayedexpansion
set counter=0

for /f "tokens=1 delims=¬" %%b in (./4600.txt) do (
    ::IF !counter! LSS 4500 call :domove "%%b" %2
	aws s3 cp "%%b" s3://myboeken-images/
    set /a counter+=1
)
endlocal
::del /q tempfilelist.txt
::GOTO:EOF

:domove
move %1 %2

GOTO:EOF