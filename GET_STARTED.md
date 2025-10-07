# 🚀 Get Started with SereneSync in 3 Steps

**Total time: 5 minutes** ⏱️

---

## Step 1: Install Flutter (First Time Only)

**Already have Flutter?** Skip to Step 2!

### Quick Install

Choose your operating system:

#### 🪟 Windows
1. Download Flutter SDK: https://docs.flutter.dev/get-started/install/windows
2. Extract to `C:\src\flutter`
3. Add to System PATH
4. Restart terminal

#### 🍎 macOS
```bash
brew install flutter
```

#### 🐧 Linux
```bash
git clone https://github.com/flutter/flutter.git -b stable ~/flutter
export PATH="$PATH:$HOME/flutter/bin"
```

### Verify Installation
```bash
flutter doctor
```

---

## Step 2: Setup SereneSync

### Automated Setup (Recommended)

**macOS/Linux:**
```bash
git clone https://github.com/navuxneeth/SereneSync.git
cd SereneSync
./scripts/setup.sh
```

**Windows:**
```cmd
git clone https://github.com/navuxneeth/SereneSync.git
cd SereneSync
scripts\setup.bat
```

The script will:
- ✅ Check your Flutter installation
- ✅ Install all dependencies
- ✅ Verify everything is ready
- ✅ Show available devices

### Manual Setup (If You Prefer)

```bash
git clone https://github.com/navuxneeth/SereneSync.git
cd SereneSync
flutter pub get
flutter doctor
```

---

## Step 3: Run the App

### Option A: Web Browser (Fastest)

```bash
flutter run -d chrome
```

✅ **Best for:** Quick testing, UI development, no device needed

### Option B: Mobile Device

**Android:**
```bash
flutter run
```

**iOS (macOS only):**
```bash
open -a Simulator
flutter run
```

✅ **Best for:** Real device testing, final testing

---

## 🎉 Success!

You should now see the SereneSync app with:
- 🏠 4 rooms (Living Room, Bedroom, Kitchen, Bathroom)
- 💡 9 pre-configured devices
- 🎮 Fully interactive controls

### Try These Actions

1. **Tap "Living Room"** to see devices
2. **Toggle a light switch** - watch it turn on/off
3. **Adjust the slider** - change brightness/speed
4. **Tap ⚙️ icon** - open settings
5. **Try "Turn All Off"** - bulk control

---

## 🔌 Optional: Connect Real Hardware

Want to control actual devices with ESP32?

1. Open Settings (⚙️ icon)
2. Enter ESP32 IP address (e.g., `http://192.168.1.100`)
3. Tap "Test" to verify connection
4. Tap "Save"
5. Pull down to refresh on home screen

**Need ESP32 setup help?** See [ESP32_API_SPEC.md](ESP32_API_SPEC.md)

---

## 🆘 Need Help?

### Quick Fixes

**Flutter not found?**
```bash
flutter doctor
# If not installed, visit: https://docs.flutter.dev/get-started/install
```

**No devices?**
```bash
flutter run -d chrome  # Use web browser
```

**Build errors?**
```bash
flutter clean
flutter pub get
flutter run
```

### Get More Help

- 📖 **Detailed Guide:** [SETUP.md](SETUP.md)
- 🚀 **Quick Start:** [QUICKSTART.md](QUICKSTART.md)
- 🏗️ **Architecture:** [ARCHITECTURE.md](ARCHITECTURE.md)
- 🐛 **Issues:** [GitHub Issues](https://github.com/navuxneeth/SereneSync/issues)

---

## 📋 Checklist

Use this to track your progress:

- [ ] Flutter SDK installed
- [ ] SereneSync repository cloned
- [ ] Dependencies installed (`flutter pub get`)
- [ ] App runs successfully
- [ ] Can see home screen with rooms
- [ ] Can control devices
- [ ] Can navigate between screens
- [ ] (Optional) ESP32 configured

---

## 🎯 What's Next?

### Just Exploring?
- Play with all the rooms and devices
- Try different device types
- Explore the settings

### Ready to Develop?
```bash
./scripts/dev-setup.sh
```
Then read [CONTRIBUTING.md](CONTRIBUTING.md)

### Want Real Hardware?
- Get an ESP32 board
- Follow [ESP32_API_SPEC.md](ESP32_API_SPEC.md)
- Connect and control real devices!

---

## 💡 Pro Tips

1. 🌐 **Use Chrome first** - easiest way to test the app
2. ⚡ **Hot reload** - press `r` while running to see changes instantly
3. 📦 **No ESP32 needed** - app works perfectly with sample data
4. 🔧 **Verify setup** - run `./scripts/verify-setup.sh` to check everything
5. 📚 **Read docs** - we have comprehensive guides for everything

---

**Happy building!** 🏠✨

If you get stuck, don't hesitate to [open an issue](https://github.com/navuxneeth/SereneSync/issues).
