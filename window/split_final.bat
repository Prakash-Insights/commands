::TESTED
@echo off
::split_final.bat "D:\nielsen-images\batch-upload"
::dir %1 /b /s /A:-D >tempfilelist.txt
echo %1
set globalvar=0
setlocal enabledelayedexpansion
for /f "tokens=1 delims=¬" %%b in (./file_list.txt) do (
	IF EXIST "%%b" (
	aws s3 cp "%%b" s3://mybo-images/   
	move "%%b" %1 ) ELSE echo "Not found"
)
endlocal
GOTO:EOF