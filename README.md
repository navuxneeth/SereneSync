# SereneSync - Smart Home Automation App

**Control your smart home devices with ease!** 🏠✨

A cross-platform Flutter application for controlling home appliances through ESP32 modules over Wi-Fi.

[![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-blue.svg)](https://flutter.dev/)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-green.svg)](https://flutter.dev/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## ⚡ Super Quick Start

**Get running in 2 commands:**

```bash
git clone https://github.com/navuxneeth/SereneSync.git && cd SereneSync
./scripts/setup.sh && flutter run -d chrome
```

**That's it!** The app opens in your browser with sample data. No ESP32 needed to try it! 🎉

> **New to Flutter?** See [GET_STARTED.md](GET_STARTED.md) for detailed setup.

---

## 🏠 Overview

SereneSync is a modern, intuitive mobile application that allows users to control their smart home devices (lights, fans, sockets) organized by rooms. The app communicates with ESP32 modules via HTTP REST API to provide real-time device control.

**✨ Key Highlights:**
- ✅ **Works immediately** - comes with sample data pre-loaded
- ✅ **No hardware required** - try all features without ESP32
- ✅ **One-command setup** - automated scripts handle everything
- ✅ **Cross-platform** - runs on Android, iOS, and Web
- ✅ **Easy to customize** - clean, well-documented code

## 📸 Screenshots

<table>
  <tr>
    <td align="center">
      <img src="screenshots/home_screen_mockup.png" alt="Home Screen" width="250"/>
      <br />
      <sub><b>Home Screen</b></sub>
      <br />
      <sub>Room-based organization</sub>
    </td>
    <td align="center">
      <img src="screenshots/room_details_mockup.png" alt="Room Details" width="250"/>
      <br />
      <sub><b>Room Details</b></sub>
      <br />
      <sub>Device controls with sliders</sub>
    </td>
    <td align="center">
      <img src="screenshots/settings_mockup.png" alt="Settings" width="250"/>
      <br />
      <sub><b>Settings</b></sub>
      <br />
      <sub>ESP32 configuration</sub>
    </td>
  </tr>
</table>

> **Note:** Visual mockups shown above. See [screenshots/README.md](screenshots/README.md) for detailed UI layouts.

## ✨ Features

- **Room-based Organization**: Manage devices organized by rooms (Living Room, Bedroom, Kitchen, Bathroom)
- **Real-time Control**: Toggle devices on/off instantly
- **Intensity Control**: Adjust brightness for lights and speed for fans with sliders
- **Modern UI**: Clean, intuitive Material Design interface
- **Quick Stats**: View total and active devices at a glance
- **ESP32 Configuration**: Easy setup and connection testing
- **Bulk Controls**: Turn all devices in a room on/off with one tap
- **Status Indicators**: Visual feedback for device states
- **Pull to Refresh**: Sync device states from ESP32
- **Expandable Architecture**: Ready for future features like voice control and scenes

## 🏗️ Architecture

### Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── appliance_type.dart  # Device type enum
│   ├── device.dart          # Device model
│   └── room.dart            # Room model
├── services/                # Business logic
│   ├── data_service.dart    # State management with Provider
│   └── esp32_service.dart   # HTTP communication with ESP32
├── screens/                 # UI screens
│   ├── home_screen.dart     # Main dashboard
│   ├── room_details_screen.dart  # Room device controls
│   └── settings_screen.dart # ESP32 configuration
└── widgets/                 # Reusable components
    ├── device_control.dart  # Device control card
    └── room_card.dart       # Room summary card
```

### Key Components

1. **Models**: Data structures for rooms, devices, and appliance types
2. **Services**: 
   - `ESP32Service`: Handles HTTP communication with ESP32 module
   - `DataService`: State management using Provider pattern
3. **Screens**: Main UI components for navigation
4. **Widgets**: Reusable UI components

## 🚀 Getting Started

### 🎯 Super Quick Start (5 Minutes)

**One command setup:**

```bash
# Clone and run automated setup
git clone https://github.com/navuxneeth/SereneSync.git
cd SereneSync
./scripts/setup.sh && flutter run -d chrome
```

**That's it!** The app will open in your browser with sample data.

### 📋 Prerequisites

- **Flutter SDK** (3.0.0 or higher) - [Install Flutter](https://docs.flutter.dev/get-started/install)
- **Optional:** Android Studio, Xcode, or Chrome browser
- **Optional:** ESP32 module (not required for initial testing)

### 🛠️ Detailed Setup

Choose your platform:

<details>
<summary><b>🐧 Linux / 🍎 macOS</b></summary>

```bash
# 1. Clone the repository
git clone https://github.com/navuxneeth/SereneSync.git
cd SereneSync

# 2. Run automated setup
chmod +x scripts/setup.sh
./scripts/setup.sh

# 3. Run the app
flutter run -d chrome  # For web browser
# OR
flutter run            # For connected device/emulator
```

</details>

<details>
<summary><b>🪟 Windows</b></summary>

```cmd
REM 1. Clone the repository
git clone https://github.com/navuxneeth/SereneSync.git
cd SereneSync

REM 2. Run automated setup
scripts\setup.bat

REM 3. Run the app
flutter run -d chrome
```

</details>

<details>
<summary><b>🛠️ Manual Setup</b></summary>

```bash
# 1. Clone the repository
git clone https://github.com/navuxneeth/SereneSync.git
cd SereneSync

# 2. Install dependencies
flutter pub get

# 3. Verify setup
flutter doctor

# 4. Run the app
flutter run
```

</details>

**Need more help?** See our detailed [SETUP.md](SETUP.md) guide.

### ESP32 Setup

The app expects the ESP32 to provide the following HTTP endpoints:

#### Get Device Status
```
GET /api/devices
Response: [
  {
    "id": "device_id",
    "name": "Device Name",
    "type": "light|fan|socket",
    "roomId": "room_id",
    "isOn": true|false,
    "intensity": 0-100 (optional)
  }
]
```

#### Toggle Device
```
POST /api/device/{deviceId}/toggle
Body: { "state": true|false }
Response: 200 OK
```

#### Set Device Intensity
```
POST /api/device/{deviceId}/intensity
Body: { "intensity": 0-100 }
Response: 200 OK
```

#### Health Check
```
GET /api/status
Response: 200 OK
```

### Configuration

1. Open the app
2. Tap the settings icon (⚙️) in the top-right corner
3. Enter your ESP32's IP address (default: `http://192.168.4.1`)
4. Tap "Test" to verify connection
5. Tap "Save" to store the configuration

## 📱 Usage

### 🎮 Quick Tour

The app is ready to use immediately with pre-loaded sample data:

1. **Home Screen** - View all rooms with device counts
   - See total and active device statistics
   - Quick access to any room
   - Pull down to refresh device states

2. **Room Details** - Control individual devices
   - Toggle devices on/off with switches
   - Adjust light brightness or fan speed with sliders
   - Turn all devices in a room on/off at once

3. **Settings** - Configure ESP32 connection
   - Enter ESP32 IP address
   - Test connection status
   - Sync with ESP32
   - View app information

### 🎯 Try These Features

```bash
1. Run the app: flutter run -d chrome
2. Click on "Living Room" to see devices
3. Toggle the "Ceiling Light" switch
4. Adjust the brightness slider
5. Try "Turn All Off" button
6. Go to Settings and explore configuration
```

### 🔌 Connect Real Hardware (Optional)

1. **Open Settings** (⚙️ icon)
2. **Enter ESP32 URL** (e.g., `http://192.168.1.100`)
3. **Test Connection** to verify
4. **Save** configuration
5. **Pull to refresh** on home screen to sync

See [ESP32_API_SPEC.md](ESP32_API_SPEC.md) for hardware setup details.

## 🎨 UI Features

- **Material Design 3**: Modern, consistent UI following latest guidelines
- **Smooth Animations**: Fluid transitions and interactions
- **Responsive Layout**: Adapts to different screen sizes
- **Visual Feedback**: Loading states, error messages, and success confirmations
- **Intuitive Icons**: Easy-to-understand device representations

## 🔧 Development

Want to contribute or customize the app? We've made it super easy!

### 🚀 Developer Quick Start

```bash
# Run development setup
./scripts/dev-setup.sh

# Start developing
flutter run -d chrome  # Best for rapid development
```

**Pro tip:** Use Chrome for fastest development cycle. Press `r` for hot reload!

### 🧪 Testing

```bash
flutter test              # Run all tests
flutter test --watch      # Watch mode (re-runs on changes)
flutter analyze           # Static code analysis
```

### 📦 Building for Production

#### Android APK
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

#### iOS App
```bash
flutter build ios --release
```

#### Web App
```bash
flutter build web
# Output: build/web/
```

### 🛠️ Development Tools

**While app is running:**
- Press `r` - Hot reload (instant updates)
- Press `R` - Hot restart (full app restart)
- Press `h` - Show all available commands

**Useful commands:**
```bash
flutter format .          # Format all Dart files
flutter clean             # Clean build artifacts
./scripts/verify-setup.sh # Verify your development setup
```

**Read more:** [CONTRIBUTING.md](CONTRIBUTING.md) | [ARCHITECTURE.md](ARCHITECTURE.md)

## 🌟 Future Enhancements

- **Voice Control**: Integration with voice assistants
- **Scenes**: Create and activate predefined device configurations
- **Scheduling**: Timer-based automation
- **Energy Monitoring**: Track power consumption
- **Multi-user Support**: Family member access control
- **Notifications**: Alerts for device events
- **Themes**: Dark mode and custom color schemes
- **Widgets**: Home screen shortcuts for quick access
- **Cloud Sync**: Backup and restore configurations

## 📦 Dependencies

- **flutter**: SDK for cross-platform development
- **provider**: State management solution
- **http**: HTTP client for API communication
- **shared_preferences**: Local storage for settings
- **cupertino_icons**: iOS-style icons

## 🐛 Troubleshooting

### Common Issues and Quick Fixes

<details>
<summary><b>"Flutter not found" error</b></summary>

**Solution:**
```bash
# Verify Flutter is installed
flutter --version

# If not found, install Flutter:
# https://docs.flutter.dev/get-started/install
```
</details>

<details>
<summary><b>"No devices found"</b></summary>

**Solution:**
```bash
# Use Chrome browser (easiest)
flutter run -d chrome

# Or start an emulator
flutter emulators --launch <emulator_id>

# Or check connected devices
flutter devices
```
</details>

<details>
<summary><b>Build errors or dependency issues</b></summary>

**Solution:**
```bash
# Clean and reinstall
flutter clean
flutter pub get
flutter run
```
</details>

<details>
<summary><b>ESP32 won't connect</b></summary>

**Checklist:**
- ✅ ESP32 powered on and running web server
- ✅ Phone/computer on same WiFi network
- ✅ Correct IP address (check with `ping`)
- ✅ Firewall not blocking connection
- ✅ ESP32 firmware has proper API endpoints

**Test with:**
```bash
curl http://192.168.1.100/api/status
```
</details>

**Still stuck?** Run our diagnostic tool:
```bash
./scripts/verify-setup.sh
```

## 📚 Documentation

| Document | Description |
|----------|-------------|
| [SETUP.md](SETUP.md) | Detailed setup guide with troubleshooting |
| [QUICKSTART.md](QUICKSTART.md) | Get running in 5 minutes |
| [ARCHITECTURE.md](ARCHITECTURE.md) | Code structure and design |
| [CONTRIBUTING.md](CONTRIBUTING.md) | How to contribute |
| [ESP32_API_SPEC.md](ESP32_API_SPEC.md) | Hardware API specification |
| [FEATURES.md](FEATURES.md) | Detailed feature list |

## 🤝 Contributing

We love contributions! Here's how to get started:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Run tests: `flutter test`
5. Commit: `git commit -m 'Add amazing feature'`
6. Push: `git push origin feature/amazing-feature`
7. Open a Pull Request

Read [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## ⭐ Show Your Support

If you find SereneSync helpful, please consider:
- ⭐ Starring this repository
- 🐛 Reporting bugs or requesting features
- 📖 Improving documentation
- 🔧 Contributing code

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 👥 Authors

- **[navuxneeth](https://github.com/navuxneeth)** - Initial work and maintenance

## 🙏 Acknowledgments

- Flutter team for the excellent framework
- ESP32 community for IoT capabilities
- Material Design team for UI guidelines
- All contributors who help improve SereneSync

---

<div align="center">

**Made with ❤️ for the Smart Home Community**

[Report Bug](https://github.com/navuxneeth/SereneSync/issues) · [Request Feature](https://github.com/navuxneeth/SereneSync/issues) · [Documentation](SETUP.md)

</div>