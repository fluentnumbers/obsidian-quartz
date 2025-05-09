@echo off

if "%1"=="sync" (
    echo Starting one-time sync...
    powershell -ExecutionPolicy Bypass -File sync_once.ps1
    echo Sync completed. Check sync_log.txt for details.
    goto :eof
)

if "%1"=="clean-log" (
    echo Cleaning up...
    if exist "content\sync_log.txt" del "content\sync_log.txt"
    echo Cleanup completed.
    goto :eof
)

if "%1"=="clean-html" (
    echo Cleaning public folder...
    if exist "public" (
        rmdir /s /q "public"
        echo Public folder cleaned.
    ) else (
        echo Public folder does not exist.
    )
    goto :eof
)

if "%1"=="quartz-sync" (
    echo Running Quartz sync...
    npx quartz sync
    echo Quartz sync completed.
    goto :eof
)

if "%1"=="quartz-build" (
    echo Building Quartz site...
    npx quartz build
    echo Build completed.
    goto :eof
)

if "%1"=="quartz-serve" (
    echo Starting Quartz development server...
    npx quartz build --serve
    goto :eof
)

if "%1"=="sync-and-serve" (
    echo Syncing content and starting development server...
    powershell -ExecutionPolicy Bypass -File sync_once.ps1
    echo Content synced. Starting Quartz server...
    if exist "public" (
        rmdir /s /q "public"
        echo Public folder cleaned.
    ) else (
        echo Public folder does not exist.
    )
    npx quartz build --serve
    goto :eof
)

echo Available commands:
echo   sync            - Sync content once
echo   clean-log       - Clean up log files
echo   clean-html      - Clean the public folder
echo   quartz-sync     - Run Quartz sync
echo   quartz-build    - Build Quartz site
echo   quartz-serve    - Start Quartz development server
echo   sync-and-serve  - Sync content and start development server
