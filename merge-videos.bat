@echo off

REM Define the path to the input file list
set INPUT_FILE=input.txt

REM Define the name of the output file
set OUTPUT_FILE=output.mp4

REM Check if FFmpeg is installed
where ffmpeg >nul 2>nul
if %errorlevel% neq 0 (
    echo FFmpeg could not be found. Please install FFmpeg to proceed.
    exit /b 1
)

REM Check if the input file list exists
if not exist "%INPUT_FILE%" (
    echo Input file list (%INPUT_FILE%) not found!
    exit /b 1
)

REM Run FFmpeg to merge the videos
ffmpeg -f concat -safe 0 -i "%INPUT_FILE%" -c copy "%OUTPUT_FILE%"

REM Check if the merge was successful
if %errorlevel% equ 0 (
    echo Videos merged successfully into %OUTPUT_FILE%
) else (
    echo An error occurred while merging videos.
)
