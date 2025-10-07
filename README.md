# SereneSync - Smart Home Automation App

A cross-platform Flutter application for controlling home appliances through ESP32 modules over Wi-Fi.

## 🏠 Overview

SereneSync is a modern, intuitive mobile application that allows users to control their smart home devices (lights, fans, sockets) organized by rooms. The app communicates with ESP32 modules via HTTP REST API to provide real-time device control.

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

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- ESP32 module with REST API endpoints

### Installation

1. Clone the repository:
```bash
git clone https://github.com/navuxneeth/sidegig-thing.git
cd sidegig-thing
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

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

### Home Screen
- View all rooms with device counts
- See active device statistics
- Quick access to any room
- Pull down to refresh device states

### Room Details
- Control individual devices
- Toggle devices on/off with switches
- Adjust light brightness or fan speed with sliders
- Turn all devices in a room on/off at once

### Settings
- Configure ESP32 connection
- Test connection status
- Sync with ESP32
- View app information

## 🎨 UI Features

- **Material Design 3**: Modern, consistent UI following latest guidelines
- **Smooth Animations**: Fluid transitions and interactions
- **Responsive Layout**: Adapts to different screen sizes
- **Visual Feedback**: Loading states, error messages, and success confirmations
- **Intuitive Icons**: Easy-to-understand device representations

## 🔧 Development

### Running Tests
```bash
flutter test
```

### Building for Production

#### Android
```bash
flutter build apk --release
```

#### iOS
```bash
flutter build ios --release
```

### Code Analysis
```bash
flutter analyze
```

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

## 🤝 Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for bugs and feature requests.

## 📄 License

This project is open source and available under the MIT License.

## 👥 Authors

- Initial work - [navuxneeth](https://github.com/navuxneeth)

## 🙏 Acknowledgments

- Flutter team for the excellent framework
- ESP32 community for IoT capabilities
- Material Design team for UI guidelines