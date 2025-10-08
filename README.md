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
flutter pub get && flutter run
```

**That's it!** The app will guide you through the setup process. 🎉

> **New to Flutter?** See [GET_STARTED.md](GET_STARTED.md) for detailed setup.

---

## 🏠 Overview

SereneSync is a modern, intuitive mobile application that allows users to control their smart home devices (lights, fans, sockets) organized by rooms. The app communicates with ESP32 modules via HTTP REST API to provide real-time device control.

**✨ Key Highlights:**
- ✅ **Guided Setup** - Welcome screen walks you through ESP32 connection
- ✅ **Fully Customizable** - Create your own rooms and devices with custom names and icons
- ✅ **No Pre-loaded Data** - Start fresh and build your smart home your way
- ✅ **Light & Dark Mode** - Switch between themes based on your preference
- ✅ **Cross-platform** - Runs on Android, iOS, and Web
- ✅ **Easy ESP32 Setup** - Simple and straightforward configuration
- ✅ **Persistent Storage** - Your settings and devices are saved locally

## 📸 Screenshots

### Light Mode
<table>
  <tr>
    <td align="center">
      <img src="screenshots/welcome_screen.png" alt="Welcome Screen" width="200"/>
      <br />
      <sub><b>Welcome Screen</b></sub>
      <br />
      <sub>First-time setup guide</sub>
    </td>
    <td align="center">
      <img src="screenshots/home_screen.png" alt="Home Screen" width="200"/>
      <br />
      <sub><b>Home Screen</b></sub>
      <br />
      <sub>Room overview dashboard</sub>
    </td>
    <td align="center">
      <img src="screenshots/manage_rooms.png" alt="Manage Rooms" width="200"/>
      <br />
      <sub><b>Manage Rooms</b></sub>
      <br />
      <sub>Create and edit rooms</sub>
    </td>
    <td align="center">
      <img src="screenshots/manage_devices.png" alt="Manage Devices" width="200"/>
      <br />
      <sub><b>Manage Devices</b></sub>
      <br />
      <sub>Add and configure devices</sub>
    </td>
  </tr>
</table>

### Dark Mode
<table>
  <tr>
    <td align="center">
      <img src="screenshots/home_dark.png" alt="Home Dark" width="200"/>
      <br />
      <sub><b>Home Screen - Dark</b></sub>
    </td>
    <td align="center">
      <img src="screenshots/room_details_dark.png" alt="Room Details Dark" width="200"/>
      <br />
      <sub><b>Room Details - Dark</b></sub>
    </td>
    <td align="center">
      <img src="screenshots/settings_dark.png" alt="Settings Dark" width="200"/>
      <br />
      <sub><b>Settings - Dark</b></sub>
    </td>
  </tr>
</table>

> **Note:** Screenshots will be added once the app is built and tested. The app features a complete light and dark theme with smooth transitions.

## ✨ Features

### 🎯 Core Features
- **Welcome Screen**: Guided onboarding experience for first-time users
- **ESP32 Setup**: Test and configure your ESP32 connection right from the start
- **Custom Room Management**: Create, edit, and delete rooms with custom names and icons
- **Custom Device Management**: Add lights, fans, and sockets with your own names and IDs
- **Light & Dark Mode**: Toggle between light and dark themes with persistent preference
- **Real-time Control**: Toggle devices on/off instantly
- **Intensity Control**: Adjust brightness for lights and speed for fans with sliders
- **Modern UI**: Clean, intuitive Material Design 3 interface
- **Quick Stats**: View total and active devices at a glance
- **Bulk Controls**: Turn all devices in a room on/off with one tap
- **Status Indicators**: Visual feedback for device states
- **Pull to Refresh**: Sync device states from ESP32
- **Persistent Storage**: All your data is saved locally using SharedPreferences

## 🏗️ Architecture

### Project Structure

```
lib/
├── main.dart                      # App entry point with theme management
├── models/                        # Data models
│   ├── appliance_type.dart       # Device type enum
│   ├── device.dart               # Device model with JSON serialization
│   └── room.dart                 # Room model with JSON serialization
├── services/                     # Business logic
│   ├── data_service.dart         # State management with Provider & persistence
│   ├── esp32_service.dart        # HTTP communication with ESP32
│   └── theme_service.dart        # Theme management service
├── screens/                      # UI screens
│   ├── welcome_screen.dart       # First-time setup and onboarding
│   ├── home_screen.dart          # Main dashboard with room overview
│   ├── room_details_screen.dart  # Room device controls
│   ├── manage_rooms_screen.dart  # Room CRUD operations
│   ├── manage_devices_screen.dart # Device CRUD operations
│   └── settings_screen.dart      # ESP32 configuration & preferences
└── widgets/                      # Reusable components
    ├── device_control.dart  # Device control card
    └── room_card.dart       # Room summary card
```

### Key Components

1. **Models**: Data structures for rooms, devices, and appliance types with JSON serialization
2. **Services**: 
   - `ESP32Service`: Handles HTTP communication with ESP32 module
   - `DataService`: State management using Provider pattern with SharedPreferences persistence
   - `ThemeService`: Manages light/dark mode with persistent preference
3. **Screens**: Complete UI flow from onboarding to device control
   - Welcome screen for first-time setup
   - Management screens for rooms and devices
   - Settings screen for configuration
4. **Widgets**: Reusable UI components for consistent design

## 🚀 Getting Started

### 📋 Prerequisites

- **Flutter SDK** (3.0.0 or higher) - [Install Flutter](https://docs.flutter.dev/get-started/install)
- **Optional:** Android Studio, Xcode, or Chrome browser
- **Optional:** ESP32 module (for actual device control)

### 🛠️ Installation

```bash
# 1. Clone the repository
git clone https://github.com/navuxneeth/SereneSync.git
cd SereneSync

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

### 🎯 First Time Setup

When you first launch SereneSync, you'll be guided through an easy setup process:

#### Step 1: Welcome Screen
- You'll see a welcome screen introducing the app
- Read about the features and what to expect

#### Step 2: ESP32 Connection
- Enter your ESP32 module's IP address (e.g., `http://192.168.4.1`)
- Tap "Test Connection" to verify connectivity
- Don't worry if it fails - you can configure it later in settings
- Tap "Continue to App" to proceed

#### Step 3: Create Your Rooms
- Navigate to the home screen
- Tap the house icon (🏠) to manage rooms
- Tap the "+" button to add your first room
- Enter a custom name (e.g., "Living Room", "Bedroom")
- Choose from 16+ emoji icons to represent your room
- Tap "Add" to save

#### Step 4: Add Your Devices
- From the home screen, tap the devices icon
- Tap the "+" button to add a device
- Enter a device name (e.g., "Ceiling Light")
- Enter a unique device ID (e.g., "device_001")
- Select the room where the device is located
- Choose the device type (Light 💡, Fan 🌀, or Socket 🔌)
- Tap "Add" to save

#### Step 5: Control Your Devices
- Tap on any room card to see its devices
- Use the switch to turn devices on/off
- For lights and fans, use the slider to adjust intensity
- Pull down to refresh and sync with your ESP32

### 🎨 Customizing Your Experience

#### Switch to Dark Mode
1. Tap the theme toggle icon (🌙/☀️) in the top-right corner of the home screen
2. Or go to Settings → Toggle "Dark Mode"

#### Manage Your Setup
- **Edit Rooms**: Tap "Manage Rooms" → Select a room → Tap edit icon
- **Delete Rooms**: Tap "Manage Rooms" → Select a room → Tap delete icon (⚠️ This also deletes all devices in the room)
- **Edit Devices**: Tap "Manage Devices" → Select a device → Tap edit icon
- **Delete Devices**: Tap "Manage Devices" → Select a device → Tap delete icon

#### Update ESP32 Connection
1. Go to Settings (⚙️ icon)
2. Update the ESP32 URL
3. Tap "Test" to verify
4. Tap "Save" to store the new URL

**Need more help?** See our detailed [SETUP.md](SETUP.md) guide.

**Want a quick reference?** Check [QUICK_REFERENCE.md](QUICK_REFERENCE.md) - printable cheat sheet!

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

## 📱 Usage

### 🎮 Using SereneSync

Once you've completed the initial setup:

1. **Home Screen** - Your smart home dashboard
   - View all your custom rooms with device counts
   - See total and active device statistics
   - Quick access to any room by tapping the room card
   - Pull down to refresh device states from ESP32
   - Use the 🏠 icon to manage rooms
   - Use the 📱 icon to manage devices
   - Toggle between light and dark mode with the theme icon

2. **Room Details** - Control individual devices
   - Toggle devices on/off with switches
   - Adjust light brightness or fan speed with sliders (when device is on)
   - Turn all devices in a room on/off at once
   - See real-time device status

3. **Settings** - Configure and customize
   - Update ESP32 IP address anytime
   - Test ESP32 connection
   - Toggle between light and dark mode
   - Sync with ESP32 to fetch latest device states
   - View app information

### 🔌 ESP32 Integration

SereneSync communicates with your ESP32 module via HTTP REST API. Your ESP32 needs to be configured on the same network and provide the required endpoints.

**What you need on your ESP32:**
- HTTP server running on your local network
- REST API endpoints for device control (see [ESP32_API_SPEC.md](ESP32_API_SPEC.md))

**Connecting to ESP32:**
1. Make sure your ESP32 is powered on and connected to WiFi
2. Open SereneSync Settings
3. Enter your ESP32's IP address (e.g., `http://192.168.1.100`)
4. Tap "Test" to verify connection
5. Tap "Save" to store the configuration

**Note:** The app works perfectly offline for testing and UI exploration. ESP32 connection is only needed for actual hardware control.

## 🎨 UI Features

- **Material Design 3**: Modern, consistent UI following latest guidelines
- **Light & Dark Mode**: Beautiful themes for any time of day
- **Smooth Animations**: Fluid transitions and interactions
- **Responsive Layout**: Adapts to different screen sizes
- **Visual Feedback**: Loading states, error messages, and success confirmations
- **Intuitive Icons**: Easy-to-understand device and room representations
- **Customizable**: Choose from 16+ icons for rooms and 3 device types

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
- **shared_preferences**: Local storage for settings and data persistence
- **url_launcher**: Open external URLs (LinkedIn profile)
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

## 👥 Author

**Navaneeth Sankar K P**
- GitHub: [@navuxneeth](https://github.com/navuxneeth)
- LinkedIn: [Navaneeth Sankar K P](https://www.linkedin.com/in/navaneeth-sankar-k-p)

## 🙏 Acknowledgments

- Flutter team for the excellent framework
- ESP32 community for IoT capabilities
- Material Design team for UI guidelines
- All contributors who help improve SereneSync

---

<div align="center">

**Made with ❤️ by [Navaneeth Sankar K P](https://www.linkedin.com/in/navaneeth-sankar-k-p)**

[Report Bug](https://github.com/navuxneeth/SereneSync/issues) · [Request Feature](https://github.com/navuxneeth/SereneSync/issues) · [Documentation](SETUP.md)

</div>