# Quick Start Guide - SereneSync

Get up and running with SereneSync in 5 minutes! 🚀

## 📋 Prerequisites

- Flutter SDK (3.0.0+) installed
- A device/emulator or Chrome browser
- (Optional) ESP32 module for actual hardware control

## ⚡ 3-Step Setup

### Step 1: Install
```bash
# Clone the repository
git clone https://github.com/navuxneeth/SereneSync.git
cd SereneSync

# Install dependencies
flutter pub get
```

### Step 2: Run
```bash
# Run on Chrome (easiest)
flutter run -d chrome

# OR run on connected device
flutter run
```

### Step 3: First Launch

When the app opens:

1. **Welcome Screen Appears**
   - Enter ESP32 IP (e.g., `http://192.168.1.100`)
   - Click "Test Connection" (optional)
   - Click "Continue to App"

2. **Create Your First Room**
   - Tap the house icon (🏠)
   - Tap "Add Room"
   - Enter name (e.g., "Living Room")
   - Choose an icon (e.g., 🛋️)
   - Tap "Add"

3. **Add Your First Device**
   - Tap the devices icon
   - Tap "Add Device"
   - Enter name (e.g., "Ceiling Light")
   - Enter ID (e.g., "light_001")
   - Select your room
   - Choose "Light" type
   - Tap "Add"

4. **Control Your Device**
   - Go back to home screen
   - Tap on your room
   - Toggle the device on/off
   - Adjust brightness slider

🎉 **Done!** You're now controlling your smart home!

## 🎨 Try These Features

### Switch to Dark Mode
- Tap the moon icon (🌙) in top-right
- Or go to Settings → Toggle "Dark Mode"

### Add More Rooms
- Home → House icon (🏠) → Add Room
- Try different icons: 🛏️ 🍳 🚿 💼 🎮

### Add Different Device Types
- Lights 💡 - With brightness control
- Fans 🌀 - With speed control
- Sockets 🔌 - Simple on/off

### Edit Anything
- Rooms: Manage Rooms → Edit icon
- Devices: Manage Devices → Edit icon
- Move devices between rooms
- Change icons anytime

## 🔧 Common Tasks

### Update ESP32 Connection
```
Settings (⚙️) → Update URL → Test → Save
```

### Toggle All Devices in a Room
```
Home → Room Card → "Turn All On/Off"
```

### Delete a Room
```
Manage Rooms → Room → Delete icon → Confirm
(Warning: Deletes all devices in room!)
```

### Sync with ESP32
```
Settings → "Sync with ESP32"
or
Pull down on any screen
```

## 📱 Platform-Specific

### Android
```bash
flutter run -d <device-id>
# OR
flutter build apk --release
```

### iOS (macOS only)
```bash
flutter run -d <simulator-id>
# OR
flutter build ios --release
```

### Web
```bash
flutter run -d chrome
# OR
flutter build web --release
```

## 🐛 Quick Troubleshooting

### App won't start?
```bash
flutter doctor
flutter clean
flutter pub get
flutter run
```

### Can't connect to ESP32?
- Check ESP32 is powered on
- Verify IP address is correct
- Ensure both devices on same network
- Try: `ping <esp32-ip>`

### Dark mode not saving?
- Should save automatically
- Try: Restart app to verify

### Lost your data?
- Data saved locally in SharedPreferences
- Survives app restarts
- Won't survive app uninstall/reinstall

## 📚 Learn More

- **Full Guide**: See [README.md](README.md)
- **Testing**: See [TESTING_GUIDE.md](TESTING_GUIDE.md)
- **Features**: See [WHATS_NEW.md](WHATS_NEW.md)
- **ESP32 Setup**: See [ESP32_API_SPEC.md](ESP32_API_SPEC.md)

## 💡 Pro Tips

1. **Use descriptive IDs**: `room_type_number` format (e.g., `lr_light_1`)
2. **Test without ESP32**: App works great for UI testing
3. **Start small**: Add 1-2 rooms first, then expand
4. **Try both themes**: Dark mode is great at night
5. **Pull to refresh**: Syncs with ESP32 anytime

## 🎯 What's Next?

After you're comfortable with the basics:

1. **Customize Icons**: Try all 16+ room icons
2. **Organize Devices**: Group by room logically
3. **ESP32 Integration**: Connect real hardware
4. **Advanced Features**: Explore all settings
5. **Share Feedback**: Open issues on GitHub

## 📞 Need Help?

- Check [README.md](README.md) for detailed docs
- Review [TESTING_GUIDE.md](TESTING_GUIDE.md) for all features
- Open an issue on GitHub
- Contact via [LinkedIn](https://www.linkedin.com/in/navaneeth-sankar-k-p)

## ⚡ Super Quick Reference

```bash
# Setup
flutter pub get && flutter run -d chrome

# Create room
Home → 🏠 → Add Room → Enter name → Choose icon → Add

# Add device  
Home → 📱 → Add Device → Enter details → Add

# Dark mode
Tap 🌙 icon OR Settings → Dark Mode toggle

# Control
Home → Room → Toggle device → Adjust slider
```

---

**Made with ❤️ by [Navaneeth Sankar K P](https://www.linkedin.com/in/navaneeth-sankar-k-p)**

Enjoy your smart home! 🏠✨
