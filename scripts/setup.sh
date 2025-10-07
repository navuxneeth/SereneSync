#!/bin/bash

# SereneSync Easy Setup Script
# This script automates the entire setup process

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔═══════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   SereneSync Easy Setup Script       ║${NC}"
echo -e "${BLUE}║   Smart Home Automation App           ║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════╝${NC}"
echo ""

# Function to print status messages
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Check if Flutter is installed
print_status "Checking Flutter installation..."
if ! command -v flutter &> /dev/null; then
    print_error "Flutter is not installed or not in PATH"
    echo ""
    echo "Please install Flutter from: https://docs.flutter.dev/get-started/install"
    echo ""
    echo "Quick install options:"
    echo "  - macOS: Visit https://docs.flutter.dev/get-started/install/macos"
    echo "  - Linux: Visit https://docs.flutter.dev/get-started/install/linux"
    echo "  - Windows: Visit https://docs.flutter.dev/get-started/install/windows"
    exit 1
fi
print_success "Flutter is installed"

# Check Flutter version
FLUTTER_VERSION=$(flutter --version | head -n 1)
print_status "Flutter version: $FLUTTER_VERSION"

# Run Flutter doctor to check setup
print_status "Running Flutter doctor to check your setup..."
echo ""
flutter doctor
echo ""

# Clean previous builds
print_status "Cleaning previous builds..."
flutter clean > /dev/null 2>&1
print_success "Cleaned previous builds"

# Get dependencies
print_status "Installing dependencies..."
flutter pub get
print_success "Dependencies installed successfully"

# Run code analysis
print_status "Running code analysis..."
if flutter analyze > /dev/null 2>&1; then
    print_success "Code analysis passed"
else
    print_warning "Code analysis found some issues (non-blocking)"
fi

# Check for available devices
print_status "Checking for available devices..."
DEVICES=$(flutter devices 2>&1)
if echo "$DEVICES" | grep -q "No devices detected"; then
    print_warning "No devices detected"
    echo ""
    echo "To run the app, you need one of the following:"
    echo "  1. Connected Android device (USB debugging enabled)"
    echo "  2. Android emulator running"
    echo "  3. iOS simulator (macOS only)"
    echo "  4. Chrome browser (for web testing)"
    echo ""
    echo "Quick start options:"
    echo "  - For Android emulator: Open Android Studio → AVD Manager → Start emulator"
    echo "  - For iOS simulator: Run 'open -a Simulator' (macOS only)"
    echo "  - For web: Run 'flutter run -d chrome'"
else
    print_success "Devices detected:"
    echo "$DEVICES" | grep -v "^$"
fi

echo ""
print_success "Setup completed successfully!"
echo ""
echo -e "${GREEN}╔═══════════════════════════════════════╗${NC}"
echo -e "${GREEN}║        Setup Complete! 🎉             ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════╝${NC}"
echo ""
echo "Next steps:"
echo "  1. To run the app: ${YELLOW}flutter run${NC}"
echo "  2. To run on web: ${YELLOW}flutter run -d chrome${NC}"
echo "  3. To run tests: ${YELLOW}flutter test${NC}"
echo "  4. To build release: ${YELLOW}flutter build apk${NC} (Android) or ${YELLOW}flutter build ios${NC} (iOS)"
echo ""
echo "The app comes with sample data pre-loaded, so you can try it immediately!"
echo "To connect to a real ESP32, open the app and go to Settings."
echo ""
echo "Need help? Check out:"
echo "  - README.md - Overview and features"
echo "  - QUICKSTART.md - Quick start guide"
echo "  - SETUP.md - Detailed setup instructions"
echo "  - QUICK_REFERENCE.md - Handy command reference"
echo ""
