@echo off
title SW Refresh Cafe - Git Update Script
echo ===================================================
echo             GIT REPOSITORY UPDATE UTILITY          
echo ===================================================
echo.

:: Check if git is initialized
git status >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Git is not initialized in this directory or Git is not installed.
    pause
    exit /b
)

echo Checking for remote updates...
git pull origin main
echo.

echo Staging all changes...
git add .
echo.

set /p msg="Enter commit message (default: 'Updates'): "
if "%msg%"=="" (
    set msg=Updates
)

echo.
echo Committing changes with message: "%msg%"
git commit -m "%msg%"
if %errorlevel% neq 0 (
    echo.
    echo [INFO] No changes to commit or commit failed.
)

echo.
echo Pushing changes to GitHub...
git push origin main
if %errorlevel% equ 0 (
    echo.
    echo ===================================================
    echo [SUCCESS] Git repository updated successfully!
    echo ===================================================
) else (
    echo.
    echo ===================================================
    echo [ERROR] Git push failed. Please check your internet or credentials.
    echo ===================================================
)

echo.
pause
