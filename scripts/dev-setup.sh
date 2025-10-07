#!/bin/bash

# SereneSync Development Environment Setup
# For contributors and developers

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}════════════════════════════════════════${NC}"
echo -e "${BLUE}   SereneSync Development Setup${NC}"
echo -e "${BLUE}════════════════════════════════════════${NC}"
echo ""

# Run basic setup first
if [ -f "scripts/setup.sh" ]; then
    echo -e "${BLUE}[INFO]${NC} Running basic setup first..."
    bash scripts/setup.sh
else
    echo -e "${YELLOW}[WARNING]${NC} Basic setup script not found, continuing..."
fi

echo ""
echo -e "${BLUE}════════════════════════════════════════${NC}"
echo -e "${BLUE}   Additional Development Setup${NC}"
echo -e "${BLUE}════════════════════════════════════════${NC}"
echo ""

# Enable hot reload
echo -e "${BLUE}[INFO]${NC} Hot reload is enabled by default in debug mode"
echo "  - Press 'r' for hot reload"
echo "  - Press 'R' for hot restart"
echo "  - Press 'h' for help"
echo ""

# Setup IDE recommendations
echo -e "${BLUE}[INFO]${NC} Recommended IDE setup:"
echo "  - VS Code with Flutter extension"
echo "  - Android Studio with Flutter plugin"
echo "  - IntelliJ IDEA with Flutter plugin"
echo ""

# Show useful commands
echo -e "${GREEN}Useful Development Commands:${NC}"
echo "  ${YELLOW}flutter run -d chrome${NC}          - Run in Chrome (best for UI dev)"
echo "  ${YELLOW}flutter run --hot${NC}              - Run with hot reload"
echo "  ${YELLOW}flutter test${NC}                   - Run all tests"
echo "  ${YELLOW}flutter test --watch${NC}           - Run tests in watch mode"
echo "  ${YELLOW}flutter analyze${NC}                - Run static analysis"
echo "  ${YELLOW}flutter format .${NC}               - Format all Dart files"
echo "  ${YELLOW}flutter doctor -v${NC}              - Detailed system info"
echo ""

# Git hooks recommendation
echo -e "${BLUE}[INFO]${NC} Consider setting up git hooks for:"
echo "  - Running tests before commit"
echo "  - Running code formatting before commit"
echo "  - Running analysis before push"
echo ""

# Documentation links
echo -e "${GREEN}📚 Developer Documentation:${NC}"
echo "  - ARCHITECTURE.md - Code structure"
echo "  - CONTRIBUTING.md - Contribution guidelines"
echo "  - ESP32_API_SPEC.md - API specification"
echo ""

echo -e "${GREEN}✓ Development environment ready!${NC}"
echo ""
echo "Happy coding! 🚀"
echo ""
