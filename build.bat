@echo off
setlocal enabledelayedexpansion

set DOCGEN=pandoc
set DOCGEN_FLAGS=--toc
set EPUB_STYLESHEET=epub-stylesheet.css
set EPUB_CODE_FONT=UbuntuMono-Regular.otf

set FILES=01-introduction.md 02-starting-out.md 03-types-and-typeclasses.md 04-syntax-in-functions.md 05-recursion.md 06-higher-order-functions.md 07-modules.md 08-making-our-own-types-and-typeclasses.md 09-input-and-output.md 10-functionally-solving-problems.md 11-functors-applicative-functors-and-monoids.md 12-a-fistful-of-monads.md 13-for-a-few-monads-more.md 14-zippers.md

if "%1"=="" goto help
if "%1"=="all" goto all
if "%1"=="epubs" goto epubs
if "%1"=="pdfs" goto pdfs
if "%1"=="clean" goto clean
echo Unknown target: %1
goto help

:help
echo Usage: build.bat [all^|epubs^|pdfs^|clean]
exit /b 1

:all
call :epubs
call :pdfs
exit /b 0

:epubs
call :check_pandoc
if not exist "out" mkdir "out"
xcopy /E /I /Y "img" "en\img" >nul
call :build_epub_en
rd /s /q "en\img" 2>nul
exit /b 0

:pdfs
call :check_pandoc
call :check_pdflatex
if not exist "out" mkdir "out"
call :build_pdf_en
exit /b 0

:build_epub_en
set FILE_ARGS=
for %%f in (%FILES%) do set FILE_ARGS=!FILE_ARGS! "en\%%f"
%DOCGEN% %DOCGEN_FLAGS% --epub-metadata=metadata.xml --css=%EPUB_STYLESHEET% --epub-embed-font=%EPUB_CODE_FONT% -o out\lyah-en.epub --epub-cover-image=img\lyah.jpg title.txt !FILE_ARGS!
exit /b 0

:build_pdf_en
set FILE_ARGS=
for %%f in (%FILES%) do set FILE_ARGS=!FILE_ARGS! "en\%%f"
%DOCGEN% %DOCGEN_FLAGS% -o out\lyah-en.pdf title.txt !FILE_ARGS!
exit /b 0

:check_pandoc
where pandoc >nul 2>&1
if errorlevel 1 (
    echo Error: pandoc not found in PATH.
    exit /b 1
)
exit /b 0

:check_pdflatex
where pdflatex >nul 2>&1
if errorlevel 1 (
    echo Warning: pdflatex not found. PDF generation may fail if pandoc uses LaTeX backend.
)
exit /b 0

:clean
if exist "out" rd /s /q "out"
exit /b 0