#!/bin/bash

# SereneSync Setup Verification Script
# Verifies that everything is set up correctly

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

ISSUES_FOUND=0

echo -e "${BLUE}╔═══════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   SereneSync Setup Verification      ║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════╝${NC}"
echo ""

# Check Flutter
echo -e "${BLUE}Checking Flutter...${NC}"
if command -v flutter &> /dev/null; then
    FLUTTER_VERSION=$(flutter --version | head -n 1)
    echo -e "${GREEN}✓${NC} Flutter is installed: $FLUTTER_VERSION"
    
    # Check Flutter version
    FLUTTER_VER=$(flutter --version | grep -oP 'Flutter \K[0-9]+\.[0-9]+' | head -1)
    MAJOR=$(echo $FLUTTER_VER | cut -d. -f1)
    MINOR=$(echo $FLUTTER_VER | cut -d. -f2)
    
    if [ "$MAJOR" -ge 3 ]; then
        echo -e "${GREEN}✓${NC} Flutter version is 3.0.0 or higher"
    else
        echo -e "${RED}✗${NC} Flutter version is below 3.0.0 (required: 3.0.0+)"
        ISSUES_FOUND=$((ISSUES_FOUND + 1))
    fi
else
    echo -e "${RED}✗${NC} Flutter is not installed or not in PATH"
    ISSUES_FOUND=$((ISSUES_FOUND + 1))
fi
echo ""

# Check Dart
echo -e "${BLUE}Checking Dart...${NC}"
if command -v dart &> /dev/null; then
    DART_VERSION=$(dart --version 2>&1 | head -n 1)
    echo -e "${GREEN}✓${NC} Dart is installed: $DART_VERSION"
else
    echo -e "${YELLOW}!${NC} Dart not found separately (comes with Flutter)"
fi
echo ""

# Check dependencies
echo -e "${BLUE}Checking dependencies...${NC}"
if [ -f "pubspec.yaml" ]; then
    echo -e "${GREEN}✓${NC} pubspec.yaml found"
    
    if [ -d ".dart_tool" ]; then
        echo -e "${GREEN}✓${NC} Dependencies have been fetched"
    else
        echo -e "${YELLOW}!${NC} Dependencies not fetched yet. Run: flutter pub get"
        ISSUES_FOUND=$((ISSUES_FOUND + 1))
    fi
else
    echo -e "${RED}✗${NC} pubspec.yaml not found"
    ISSUES_FOUND=$((ISSUES_FOUND + 1))
fi
echo ""

# Check required directories
echo -e "${BLUE}Checking project structure...${NC}"
REQUIRED_DIRS=("lib" "lib/models" "lib/services" "lib/screens" "lib/widgets" "test")
for dir in "${REQUIRED_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo -e "${GREEN}✓${NC} $dir/ exists"
    else
        echo -e "${RED}✗${NC} $dir/ is missing"
        ISSUES_FOUND=$((ISSUES_FOUND + 1))
    fi
done
echo ""

# Check for devices
echo -e "${BLUE}Checking for devices...${NC}"
DEVICES=$(flutter devices 2>&1)
if echo "$DEVICES" | grep -q "No devices detected"; then
    echo -e "${YELLOW}!${NC} No devices detected"
    echo "  To run the app, start an emulator or connect a device"
else
    DEVICE_COUNT=$(echo "$DEVICES" | grep -c "•" || true)
    echo -e "${GREEN}✓${NC} $DEVICE_COUNT device(s) available"
fi
echo ""

# Run analysis
echo -e "${BLUE}Running code analysis...${NC}"
if flutter analyze > /tmp/analysis.log 2>&1; then
    echo -e "${GREEN}✓${NC} No analysis issues found"
else
    ISSUE_COUNT=$(grep -c "error •" /tmp/analysis.log || echo "0")
    WARNING_COUNT=$(grep -c "warning •" /tmp/analysis.log || echo "0")
    
    if [ "$ISSUE_COUNT" -gt 0 ]; then
        echo -e "${RED}✗${NC} $ISSUE_COUNT error(s) found in code"
        ISSUES_FOUND=$((ISSUES_FOUND + 1))
    fi
    
    if [ "$WARNING_COUNT" -gt 0 ]; then
        echo -e "${YELLOW}!${NC} $WARNING_COUNT warning(s) found in code"
    fi
fi
echo ""

# Test compilation
echo -e "${BLUE}Testing if app can build...${NC}"
if flutter build apk --debug --target-platform android-arm64 > /tmp/build.log 2>&1; then
    echo -e "${GREEN}✓${NC} App builds successfully"
else
    echo -e "${RED}✗${NC} App build failed (check build.log for details)"
    ISSUES_FOUND=$((ISSUES_FOUND + 1))
fi
echo ""

# Summary
echo -e "${BLUE}═══════════════════════════════════════${NC}"
if [ $ISSUES_FOUND -eq 0 ]; then
    echo -e "${GREEN}✓ All checks passed!${NC}"
    echo ""
    echo "Your setup is ready. You can now:"
    echo "  1. Run the app: flutter run"
    echo "  2. Run tests: flutter test"
    echo "  3. Build release: flutter build apk"
else
    echo -e "${RED}✗ Found $ISSUES_FOUND issue(s)${NC}"
    echo ""
    echo "Please fix the issues above and run this script again."
fi
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo ""

exit $ISSUES_FOUND
