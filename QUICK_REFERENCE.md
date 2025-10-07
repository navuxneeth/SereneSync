# SereneSync Quick Reference Card

**Print this page for easy reference!**

---

## ⚡ Installation (First Time)

```bash
# One-command setup:
git clone https://github.com/navuxneeth/SereneSync.git && cd SereneSync
./scripts/setup.sh && flutter run -d chrome
```

**Windows:** Use `scripts\setup.bat` instead of `./scripts/setup.sh`

---

## 🚀 Daily Commands

| Task | Command |
|------|---------|
| Run app (web) | `flutter run -d chrome` |
| Run app (mobile) | `flutter run` |
| Hot reload | Press `r` while running |
| Hot restart | Press `R` while running |
| Run tests | `flutter test` |
| Check code | `flutter analyze` |
| Format code | `flutter format .` |
| Clean build | `flutter clean` |
| Get dependencies | `flutter pub get` |

---

## 🛠️ Useful Scripts

| Script | Purpose |
|--------|---------|
| `./scripts/setup.sh` | Complete setup automation |
| `./scripts/verify-setup.sh` | Check if setup is correct |
| `./scripts/dev-setup.sh` | Configure dev environment |

---

## 🐛 Quick Fixes

| Problem | Solution |
|---------|----------|
| Flutter not found | Install Flutter + add to PATH |
| No devices | Run `flutter run -d chrome` |
| Build failed | `flutter clean && flutter pub get` |
| Permission denied | `chmod +x scripts/*.sh` |
| Dependencies error | `flutter pub cache clean && flutter pub get` |

---

## 📱 Device Selection

```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d chrome          # Web browser
flutter run -d <device-id>     # Specific device
```

---

## 📚 Documentation Quick Links

| Document | Purpose |
|----------|---------|
| [GET_STARTED.md](GET_STARTED.md) | Beginner's guide (start here!) |
| [SETUP.md](SETUP.md) | Detailed setup instructions |
| [README.md](README.md) | Project overview |
| [QUICKSTART.md](QUICKSTART.md) | Fast setup guide |
| [ARCHITECTURE.md](ARCHITECTURE.md) | Code structure |
| [CONTRIBUTING.md](CONTRIBUTING.md) | How to contribute |
| [ESP32_API_SPEC.md](ESP32_API_SPEC.md) | Hardware API docs |

---

## 🎯 Project Structure

```
lib/
├── main.dart              # App entry
├── models/                # Data models
├── services/              # Business logic
├── screens/               # UI screens
└── widgets/               # Reusable components
```

---

## ⚙️ Configuration

### ESP32 Setup (Optional)
1. Open app → Settings (⚙️)
2. Enter ESP32 URL: `http://192.168.x.x`
3. Tap "Test" → "Save"
4. Pull down on home screen to sync

---

## 🎨 Customization

### Add New Room
Edit `lib/services/data_service.dart`:
```dart
Room(id: '5', name: 'New Room', icon: '🏠')
```

### Add New Device
```dart
Device(
  id: 'device_id',
  name: 'Device Name',
  type: ApplianceType.light,
  roomId: 'room_id',
)
```

### Change Theme Color
Edit `lib/main.dart`:
```dart
seedColor: Colors.blue  // Change color
```

---

## 🔍 Troubleshooting

### Verify Setup
```bash
./scripts/verify-setup.sh
```

### Check Flutter
```bash
flutter doctor -v
```

### Clean Everything
```bash
flutter clean
flutter pub get
flutter run
```

---

## 💡 Pro Tips

1. ⚡ Use Chrome for fastest development
2. 🔥 Hot reload with `r` - instant updates
3. 📦 No ESP32 needed - sample data included
4. 🔧 Run verify-setup.sh when in doubt
5. 📖 Read GET_STARTED.md first time
6. 🌐 Web version works everywhere

---

## 📞 Get Help

- 📖 **Documentation**: Check GET_STARTED.md, SETUP.md, README.md
- 🐛 **Issues**: https://github.com/navuxneeth/SereneSync/issues
- 💬 **Questions**: Open a GitHub issue

---

## ✅ Success Checklist

Setup is complete when you can:
- [ ] Run `flutter doctor` without critical errors
- [ ] Run `flutter run -d chrome` successfully
- [ ] See home screen with 4 rooms
- [ ] Click a room and see devices
- [ ] Toggle a device on/off
- [ ] Adjust a slider
- [ ] Open Settings screen

---

## 🎉 Quick Start Summary

**3 Steps to Running:**
1. Clone: `git clone https://github.com/navuxneeth/SereneSync.git`
2. Setup: `./scripts/setup.sh`
3. Run: `flutter run -d chrome`

**Total Time:** 5 minutes

---

## 📊 Platform-Specific

### Linux/macOS
```bash
./scripts/setup.sh
flutter run -d chrome
```

### Windows
```cmd
scripts\setup.bat
flutter run -d chrome
```

### Manual (All Platforms)
```bash
flutter pub get
flutter doctor
flutter run -d chrome
```

---

**SereneSync v1.0.0** | [GitHub](https://github.com/navuxneeth/SereneSync) | [Issues](https://github.com/navuxneeth/SereneSync/issues)

*This is a quick reference. See full documentation for details.*
