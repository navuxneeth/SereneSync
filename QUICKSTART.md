# SereneSync Quick Start Guide

Get your SereneSync smart home app up and running in minutes!

## 📋 Prerequisites

Before you begin, ensure you have:

- **Flutter SDK** installed (3.0.0 or higher) - [Installation Guide](https://docs.flutter.dev/get-started/install)
- **Android Studio** or **Xcode** (depending on your target platform)
- An **ESP32 module** with Wi-Fi capability (optional for initial testing)
- A device for testing (Android/iOS device or emulator)

## 🚀 5-Minute Setup

### Step 1: Clone and Setup

```bash
# Clone the repository
git clone https://github.com/navuxneeth/sidegig-thing.git
cd sidegig-thing

# Install dependencies
flutter pub get

# Verify Flutter installation
flutter doctor
```

### Step 2: Run the App

**On Android Device/Emulator:**
```bash
flutter run
```

**On iOS Simulator:**
```bash
flutter run -d "iPhone 14"
```

**On Chrome (Web):**
```bash
flutter run -d chrome
```

That's it! The app will launch with sample data pre-loaded.

## 🎮 Try It Out (Without ESP32)

The app comes with sample data, so you can explore all features immediately:

1. **Home Screen**: See 4 pre-configured rooms
   - Living Room (3 devices)
   - Bedroom (3 devices)
   - Kitchen (2 devices)
   - Bathroom (1 device)

2. **Toggle Devices**: Tap any room card → Use switches to control devices

3. **Adjust Intensity**: When a device is ON, use sliders for brightness/speed

4. **Bulk Controls**: Tap "Turn All On/Off" in any room

5. **Settings**: Tap the gear icon → Configure ESP32 connection

## 🔌 Connect to Real ESP32

### Configure ESP32 URL

1. Ensure your phone/computer is on the same network as ESP32
2. Find your ESP32's IP address (default: 192.168.4.1 if using AP mode)
3. Open SereneSync → Settings
4. Enter ESP32 URL: `http://192.168.4.x`
5. Tap "Test" to verify connection
6. Tap "Save" to store configuration

### Sync with ESP32

After configuration:
1. Pull down on Home Screen to refresh
2. Or go to Settings → "Sync with ESP32"

## 📱 Platform-Specific Instructions

### Android

**Enable USB Debugging:**
1. Settings → About Phone → Tap "Build Number" 7 times
2. Settings → Developer Options → Enable "USB Debugging"
3. Connect device via USB
4. Run: `flutter devices` to verify
5. Run: `flutter run`

**Build APK:**
```bash
flutter build apk --release
# APK will be at: build/app/outputs/flutter-apk/app-release.apk
```

### iOS

**Requirements:**
- macOS computer
- Xcode installed
- Apple Developer account (for device testing)

**Run on Simulator:**
```bash
open -a Simulator
flutter run
```

**Build IPA:**
```bash
flutter build ios --release
```

### Web

**Run in Browser:**
```bash
flutter run -d chrome
```

**Build for Hosting:**
```bash
flutter build web
# Output will be in: build/web/
```

## 🧪 Testing Features

### Test Device Control
1. Go to Living Room
2. Toggle "Ceiling Light" - watch the switch animate
3. Adjust the slider - see percentage update
4. Toggle back off - slider disappears

### Test Room Control
1. Open any room
2. Turn individual devices on
3. Tap "Turn All Off" - all devices switch off together

### Test Settings
1. Go to Settings
2. Try different ESP32 URLs
3. Test connection (will fail without real ESP32, but UI works)

## 🎨 Customization

### Add Your Own Rooms

Edit `lib/services/data_service.dart`:

```dart
_rooms = [
  Room(id: '5', name: 'Your Room', icon: '🏠'),
  // Add more rooms...
];
```

### Add Your Own Devices

```dart
_devices = [
  Device(
    id: 'your_device_id',
    name: 'Your Device',
    type: ApplianceType.light,
    roomId: '5', // Match room ID
    isOn: false,
    intensity: 50,
  ),
];
```

### Change Theme Colors

Edit `lib/main.dart`:

```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple, // Change color here
    brightness: Brightness.light,
  ),
  // ...
)
```

## 🐛 Troubleshooting

### "Flutter not found"
```bash
# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"
```

### "No devices found"
```bash
# Check connected devices
flutter devices

# For Android emulator
emulator -avd Pixel_6_API_33

# For iOS simulator
open -a Simulator
```

### "Pub get failed"
```bash
# Clear cache and retry
flutter clean
flutter pub get
```

### "Build failed"
```bash
# Clean build
flutter clean
flutter pub get
flutter run
```

### ESP32 Connection Issues

**Cannot connect to ESP32:**
- Verify ESP32 is powered on
- Check Wi-Fi connection (same network)
- Verify IP address is correct
- Try pinging: `ping 192.168.4.1`
- Check ESP32 firmware is running web server

**Connection timeout:**
- ESP32 might be slow to respond
- Check ESP32 serial monitor for errors
- Verify firewall settings
- Try from different device

## 📚 Next Steps

### For Users
- Read the [README.md](README.md) for full feature list
- Check [ESP32_API_SPEC.md](ESP32_API_SPEC.md) for hardware setup
- Explore the Settings screen for configuration options

### For Developers
- Read [ARCHITECTURE.md](ARCHITECTURE.md) to understand code structure
- Check `test/widget_test.dart` for testing examples
- Explore the codebase starting from `lib/main.dart`

### For ESP32 Setup
- See [ESP32_API_SPEC.md](ESP32_API_SPEC.md) for required endpoints
- Implement the REST API on your ESP32
- Test each endpoint with curl/Postman first

## 💡 Pro Tips

1. **Use Hot Reload**: Press `r` in terminal while app is running to instantly see changes
2. **Use Hot Restart**: Press `R` for full restart
3. **Debug with Chrome**: Best for UI development and debugging
4. **Check Console**: Watch for ESP32 connection logs
5. **Sample Data**: Useful for development without hardware

## 🎯 Common Use Cases

### Scenario 1: Demo Without Hardware
- Just run the app - sample data included
- All UI features work without ESP32
- Perfect for showcasing the interface

### Scenario 2: Development with Mock Server
- Use Postman or similar to create mock API
- Point app to mock server URL
- Test without physical devices

### Scenario 3: Production with Real ESP32
- Flash ESP32 with proper firmware
- Configure network settings
- Update app with ESP32's IP
- Full control of real devices!

## 📞 Getting Help

- **Issues**: Report bugs on GitHub Issues
- **Questions**: Check existing issues or create new one
- **ESP32 Help**: See ESP32_API_SPEC.md for endpoint details

## 🎉 Success!

If you can:
- ✅ Open the app and see rooms
- ✅ Toggle device switches
- ✅ Adjust sliders
- ✅ Navigate between screens

You're all set! Enjoy your smart home control system! 🏠✨