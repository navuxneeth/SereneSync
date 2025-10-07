@echo off
REM SereneSync Easy Setup Script for Windows
REM This script automates the entire setup process

echo ================================================
echo    SereneSync Easy Setup Script
echo    Smart Home Automation App
echo ================================================
echo.

REM Check if Flutter is installed
echo [INFO] Checking Flutter installation...
where flutter >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Flutter is not installed or not in PATH
    echo.
    echo Please install Flutter from: https://docs.flutter.dev/get-started/install/windows
    echo.
    pause
    exit /b 1
)
echo [OK] Flutter is installed
echo.

REM Check Flutter version
echo [INFO] Flutter version:
flutter --version | findstr "Flutter"
echo.

REM Run Flutter doctor
echo [INFO] Running Flutter doctor to check your setup...
echo.
flutter doctor
echo.

REM Clean previous builds
echo [INFO] Cleaning previous builds...
flutter clean >nul 2>&1
echo [OK] Cleaned previous builds
echo.

REM Get dependencies
echo [INFO] Installing dependencies...
flutter pub get
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Failed to install dependencies
    pause
    exit /b 1
)
echo [OK] Dependencies installed successfully
echo.

REM Run code analysis
echo [INFO] Running code analysis...
flutter analyze >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [OK] Code analysis passed
) else (
    echo [WARNING] Code analysis found some issues (non-blocking)
)
echo.

REM Check for available devices
echo [INFO] Checking for available devices...
flutter devices
echo.

echo ================================================
echo        Setup Complete! 🎉
echo ================================================
echo.
echo Next steps:
echo   1. To run the app: flutter run
echo   2. To run on web: flutter run -d chrome
echo   3. To run tests: flutter test
echo   4. To build release: flutter build apk
echo.
echo The app comes with sample data pre-loaded, so you can try it immediately!
echo To connect to a real ESP32, open the app and go to Settings.
echo.
echo Need help? Check out:
echo   - README.md - Overview and features
echo   - QUICKSTART.md - Quick start guide
echo   - SETUP.md - Detailed setup instructions
echo   - QUICK_REFERENCE.md - Handy command reference
echo.
pause
