# Changelog

All notable changes to the SereneSync project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-01-XX

### Added - Initial Release 🎉

#### Core Features
- **Home Dashboard**: Room-based device organization with quick stats
- **Room Management**: 4 pre-configured rooms (Living Room, Bedroom, Kitchen, Bathroom)
- **Device Control**: Toggle switches for on/off control
- **Intensity Control**: Sliders for adjustable lights and fan speeds (0-100%)
- **Bulk Operations**: Turn all devices in a room on/off with one tap
- **Settings Panel**: ESP32 connection configuration and testing
- **Pull-to-Refresh**: Sync device states from ESP32 module
- **Status Indicators**: Visual feedback for active/inactive devices

#### Device Types
- 💡 **Lights**: On/off with brightness control
- 🌀 **Fans**: On/off with speed control
- 🔌 **Sockets**: On/off control

#### Technical Features
- Cross-platform support (Android, iOS, Web)
- Material Design 3 UI
- Provider state management
- HTTP REST API integration
- Local preferences storage
- Sample data for demonstration
- Optimistic UI updates
- Error handling and user feedback
- Connection testing
- Configurable ESP32 endpoints

#### Documentation
- Comprehensive README with setup instructions
- ESP32 API specification with code examples
- Architecture documentation
- Quick start guide
- Inline code documentation

#### Testing
- Unit tests for data models
- Widget tests for UI components
- Model serialization/deserialization tests

#### Platform Support
- **Android**: Minimum SDK 21 (Android 5.0)
- **iOS**: Minimum iOS 11.0
- **Web**: Modern browsers

### Architecture

#### Project Structure
```
lib/
├── main.dart                    # App entry point
├── models/                      # Data models
│   ├── appliance_type.dart     # Device types
│   ├── device.dart             # Device model
│   └── room.dart               # Room model
├── services/                    # Business logic
│   ├── data_service.dart       # State management
│   └── esp32_service.dart      # ESP32 communication
├── screens/                     # UI screens
│   ├── home_screen.dart        # Main dashboard
│   ├── room_details_screen.dart # Room controls
│   └── settings_screen.dart    # Configuration
└── widgets/                     # Reusable components
    ├── device_control.dart     # Device cards
    └── room_card.dart          # Room cards
```

#### Dependencies
- `flutter`: ^3.0.0
- `provider`: ^6.0.5
- `http`: ^1.1.0
- `shared_preferences`: ^2.2.0
- `cupertino_icons`: ^1.0.2
- `flutter_lints`: ^2.0.0

### Known Limitations

- No authentication (local network use only)
- HTTP only (no HTTPS)
- No offline mode
- No cloud synchronization
- No multi-user support
- No voice control (planned)
- No scene management (planned)
- No scheduling (planned)

### Future Roadmap

See README.md for planned enhancements including:
- Voice control integration
- Scene creation and management
- Scheduling and automation
- Energy monitoring
- Multi-user support
- Cloud backup
- Dark theme
- Home screen widgets

### ESP32 Requirements

The app requires ESP32 to implement these endpoints:
- `GET /api/devices` - Get all device states
- `POST /api/device/{id}/toggle` - Toggle device
- `POST /api/device/{id}/intensity` - Set intensity
- `GET /api/status` - Health check

See ESP32_API_SPEC.md for complete specification.

### Installation

```bash
git clone https://github.com/navuxneeth/sidegig-thing.git
cd sidegig-thing
flutter pub get
flutter run
```

### Contributors

- Initial development by navuxneeth

---

## Version History

### Version 1.0.0
- Initial MVP release
- Full feature set for basic home automation
- Complete documentation
- Cross-platform support
- Sample data for testing

---

**Note**: This is the first major release. Future versions will add advanced features while maintaining backward compatibility with ESP32 firmware.
