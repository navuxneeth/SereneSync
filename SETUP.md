# 🚀 SereneSync - Super Easy Setup Guide

**Get your smart home app running in 5 minutes!** ⏱️

This guide is designed to be beginner-friendly and get you up and running as quickly as possible.

---

## 📱 What You'll Get

A fully functional smart home control app that works on:
- ✅ Android phones and tablets
- ✅ iPhones and iPads
- ✅ Web browsers

**No ESP32 hardware needed to start!** The app comes with sample data so you can try it immediately.

---

## 🎯 Super Quick Start (Recommended)

### One-Command Setup

**For macOS/Linux:**
```bash
git clone https://github.com/navuxneeth/SereneSync.git
cd SereneSync
chmod +x scripts/setup.sh
./scripts/setup.sh
flutter run
```

**For Windows:**
```cmd
git clone https://github.com/navuxneeth/SereneSync.git
cd SereneSync
scripts\setup.bat
flutter run
```

That's it! The setup script will:
- ✅ Check your Flutter installation
- ✅ Install all dependencies
- ✅ Verify your setup
- ✅ Show you available devices
- ✅ Give you next steps

---

## 📋 Prerequisites (First Time Only)

### Step 1: Install Flutter

**Don't have Flutter?** Pick your platform:

#### Windows
1. Download: https://docs.flutter.dev/get-started/install/windows
2. Extract to `C:\src\flutter`
3. Add to PATH: `C:\src\flutter\bin`
4. Restart terminal

#### macOS
```bash
# Using Homebrew (easiest)
brew install flutter

# Or download from:
# https://docs.flutter.dev/get-started/install/macos
```

#### Linux
```bash
# Download and extract
cd ~/development
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Add to ~/.bashrc for permanent access
echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.bashrc
```

### Step 2: Verify Flutter Installation

```bash
flutter doctor
```

You should see something like:
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x, on macOS...)
[✓] Android toolchain - develop for Android devices
[✓] Chrome - develop for the web
[✓] Xcode - develop for iOS and macOS (macOS only)
[✓] VS Code (version x.x.x)
[✓] Connected device (1 available)
```

**Don't worry if some checks have warnings!** As long as Flutter is installed, you can continue.

---

## 🎮 Running the App

### Option 1: Web Browser (Easiest for Testing)

```bash
flutter run -d chrome
```

Perfect for:
- 🎨 Testing the UI
- 🔧 Trying features quickly
- 💻 Development on any platform

### Option 2: Android Device

1. Enable USB Debugging on your phone:
   - Settings → About Phone → Tap "Build Number" 7 times
   - Settings → Developer Options → Enable "USB Debugging"

2. Connect phone via USB

3. Run the app:
```bash
flutter run
```

### Option 3: Android Emulator

1. Open Android Studio
2. Tools → Device Manager
3. Create/Start an emulator
4. Run: `flutter run`

### Option 4: iOS Simulator (macOS only)

```bash
open -a Simulator
flutter run
```

---

## ✅ Verify Your Setup

Run our verification script to check everything:

**macOS/Linux:**
```bash
./scripts/verify-setup.sh
```

**Windows:**
```cmd
# Manual verification:
flutter doctor
flutter analyze
```

---

## 🎨 Exploring the App

Once the app is running, you'll see:

### Home Screen
- 4 pre-configured rooms (Living Room, Bedroom, Kitchen, Bathroom)
- Device counts for each room
- Total active devices at the top

### Room Details
- Tap any room to see its devices
- Toggle switches to turn devices on/off
- Adjust sliders for brightness (lights) or speed (fans)
- "Turn All On/Off" button at the bottom

### Settings
- Tap ⚙️ icon in top-right
- Configure ESP32 connection (optional)
- Test connection
- About information

---

## 🔌 Connecting to Real ESP32 (Optional)

Want to control real devices? Follow these steps:

### 1. Prepare Your ESP32
- Flash ESP32 with appropriate firmware
- Connect ESP32 to your WiFi network
- Note the IP address (e.g., 192.168.1.100)

### 2. Configure in App
1. Open SereneSync
2. Tap Settings (⚙️ icon)
3. Enter ESP32 URL: `http://192.168.1.100`
4. Tap "Test" to verify connection
5. Tap "Save"

### 3. Sync Devices
- Pull down on Home Screen to refresh
- Or: Settings → "Sync with ESP32"

For ESP32 API details, see [ESP32_API_SPEC.md](ESP32_API_SPEC.md)

---

## 🛠️ Development Setup

Are you a developer wanting to modify the app?

**Run the development setup:**
```bash
./scripts/dev-setup.sh
```

This will:
- Set up your development environment
- Show useful commands
- Configure hot reload
- Provide IDE recommendations

**Key development commands:**
```bash
flutter run -d chrome        # Run in Chrome (best for UI dev)
flutter test                 # Run tests
flutter test --watch         # Run tests in watch mode
flutter analyze              # Check for issues
flutter format .             # Format code
```

**While app is running:**
- Press `r` - Hot reload (instant updates)
- Press `R` - Hot restart (full restart)
- Press `h` - Show help

---

## 🐛 Troubleshooting

### "Flutter not found"

**Solution:**
```bash
# Check if Flutter is in PATH
which flutter  # macOS/Linux
where flutter  # Windows

# If not found, add to PATH
export PATH="$PATH:/path/to/flutter/bin"  # macOS/Linux
```

### "No devices found"

**Solution:**
- For web: Run `flutter run -d chrome`
- For Android: Start emulator or connect device
- For iOS: Run `open -a Simulator` (macOS)

### "Build failed"

**Solution:**
```bash
flutter clean
flutter pub get
flutter run
```

### "Permission denied" (Linux/macOS)

**Solution:**
```bash
chmod +x scripts/setup.sh
```

### Dependencies not installing

**Solution:**
```bash
flutter pub cache clean
flutter pub get
```

### ESP32 not connecting

**Check:**
- ✅ ESP32 is powered on
- ✅ Phone/computer on same network as ESP32
- ✅ Correct IP address entered
- ✅ ESP32 firmware is running web server
- ✅ Try pinging: `ping 192.168.1.100`

---

## 📚 Additional Resources

### Documentation Files
- **[README.md](README.md)** - Project overview and features
- **[QUICKSTART.md](QUICKSTART.md)** - Alternative quick start guide
- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Code structure (for developers)
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - How to contribute
- **[ESP32_API_SPEC.md](ESP32_API_SPEC.md)** - ESP32 API documentation

### Need Help?
- 🐛 **Found a bug?** Open an issue on GitHub
- ❓ **Have a question?** Check existing issues or create a new one
- 💡 **Want a feature?** Submit a feature request

---

## 🎉 Success Checklist

You're all set if you can:
- ✅ Run the app (`flutter run`)
- ✅ See the home screen with 4 rooms
- ✅ Navigate to a room and see devices
- ✅ Toggle a device on/off
- ✅ Adjust a slider (when device is on)
- ✅ Open settings screen

---

## 🚀 Next Steps

### For Users
1. Explore all rooms and devices
2. Try the "Turn All On/Off" feature
3. Configure ESP32 connection (if you have hardware)
4. Enjoy your smart home control!

### For Developers
1. Read [ARCHITECTURE.md](ARCHITECTURE.md) to understand the code
2. Run tests: `flutter test`
3. Make changes (hot reload with `r`)
4. Read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting PRs

---

## 💡 Pro Tips

1. **Use Chrome for Development**: `flutter run -d chrome` - fastest feedback loop
2. **Hot Reload is Magic**: Press `r` to see changes instantly
3. **No Hardware Needed**: App works perfectly with sample data
4. **Start Simple**: Get familiar with the UI before connecting ESP32
5. **Check Console**: Useful debug info appears in terminal

---

## 📊 What's Included

- ✅ 4 pre-configured rooms
- ✅ 9 sample devices
- ✅ 3 device types (lights, fans, sockets)
- ✅ Material Design 3 UI
- ✅ Cross-platform support
- ✅ ESP32 integration ready
- ✅ Complete documentation

---

**Ready to build your smart home? Let's go!** 🏠✨

For the fastest start: Run `./scripts/setup.sh` and then `flutter run -d chrome`
