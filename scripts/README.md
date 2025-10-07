# SereneSync Setup Scripts

Automated scripts to make setup and development as easy as possible!

## 🚀 Setup Scripts

### `setup.sh` / `setup.bat` - Complete Setup Automation

**What it does:**
- ✅ Checks Flutter installation
- ✅ Verifies Flutter version (3.0.0+)
- ✅ Runs Flutter doctor
- ✅ Cleans previous builds
- ✅ Installs all dependencies
- ✅ Runs code analysis
- ✅ Checks for available devices
- ✅ Shows next steps

**Usage:**

**macOS/Linux:**
```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

**Windows:**
```cmd
scripts\setup.bat
```

---

### `dev-setup.sh` - Development Environment Setup

**What it does:**
- ✅ Runs basic setup first
- ✅ Enables hot reload
- ✅ Shows IDE recommendations
- ✅ Lists useful development commands
- ✅ Suggests git hooks
- ✅ Links to developer documentation

**Usage:**
```bash
./scripts/dev-setup.sh
```

**Perfect for:** Contributors and developers who want to modify the app

---

### `verify-setup.sh` - Setup Verification

**What it does:**
- ✅ Checks Flutter installation
- ✅ Verifies Flutter version
- ✅ Checks Dart installation
- ✅ Verifies dependencies
- ✅ Checks project structure
- ✅ Lists available devices
- ✅ Runs code analysis
- ✅ Tests if app can build

**Usage:**
```bash
./scripts/verify-setup.sh
```

**Perfect for:** Troubleshooting setup issues

---

## 📋 Quick Reference

### First Time Setup
```bash
# 1. Clone repository
git clone https://github.com/navuxneeth/SereneSync.git
cd SereneSync

# 2. Run setup
./scripts/setup.sh

# 3. Run app
flutter run -d chrome
```

### Development Setup
```bash
# For contributors
./scripts/dev-setup.sh
```

### Verify Everything Works
```bash
# Check your setup
./scripts/verify-setup.sh
```

---

## 🛠️ Script Features

### Cross-Platform Support
- ✅ Bash scripts for macOS/Linux
- ✅ Batch scripts for Windows
- ✅ Same functionality on all platforms

### User-Friendly Output
- 🔵 Info messages (blue)
- ✅ Success messages (green)
- ⚠️ Warnings (yellow)
- ❌ Errors (red)

### Error Handling
- Exits on critical errors
- Provides helpful error messages
- Suggests solutions for common issues

### No Sudo Required
- All scripts run without elevated privileges
- Safe to run in any environment

---

## 🐛 Troubleshooting

### Script Won't Run (Linux/macOS)

**Error:** `Permission denied`

**Solution:**
```bash
chmod +x scripts/*.sh
./scripts/setup.sh
```

### Flutter Not Found

**Error:** `Flutter is not installed or not in PATH`

**Solution:**
1. Install Flutter: https://docs.flutter.dev/get-started/install
2. Add Flutter to PATH
3. Restart terminal
4. Run script again

### Setup Script Fails

**Solution:**
1. Run verification script: `./scripts/verify-setup.sh`
2. Check the error messages
3. Fix reported issues
4. Run setup script again

---

## 💡 Tips

1. **Always run setup.sh first** - It checks everything you need
2. **Use verify-setup.sh for debugging** - It shows exactly what's wrong
3. **dev-setup.sh is optional** - Only needed if you're developing
4. **Scripts are idempotent** - Safe to run multiple times

---

## 📚 More Help

- **Setup Guide:** [../SETUP.md](../SETUP.md)
- **Quick Start:** [../QUICKSTART.md](../QUICKSTART.md)
- **Get Started:** [../GET_STARTED.md](../GET_STARTED.md)
- **Contributing:** [../CONTRIBUTING.md](../CONTRIBUTING.md)

---

**Made with ❤️ to make SereneSync easy to set up!**
