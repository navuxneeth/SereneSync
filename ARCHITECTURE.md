# SereneSync Architecture Documentation

## Overview

SereneSync follows a clean architecture pattern with clear separation of concerns, making it easy to maintain, test, and extend.

## Architecture Layers

### 1. Presentation Layer (UI)

**Location:** `lib/screens/`, `lib/widgets/`

The presentation layer contains all UI components and handles user interactions.

#### Screens
- **HomeScreen**: Dashboard showing all rooms and quick stats
- **RoomDetailsScreen**: Detailed view of devices in a specific room
- **SettingsScreen**: Configuration and ESP32 connection settings

#### Widgets
- **RoomCard**: Reusable card component for room display
- **DeviceControl**: Reusable component for device control with switch and slider

**Responsibilities:**
- Display data from the business logic layer
- Handle user input and gestures
- Provide visual feedback
- Navigate between screens

### 2. Business Logic Layer (Services)

**Location:** `lib/services/`

This layer contains the app's business logic and state management.

#### DataService

`data_service.dart` - Main state management using Provider pattern

**Responsibilities:**
- Manage application state (rooms and devices)
- Coordinate between UI and ESP32Service
- Handle local data transformations
- Notify listeners of state changes
- Provide sample data for demonstration

**Key Methods:**
```dart
- getDevicesByRoom(String roomId)
- toggleDevice(Device device)
- setDeviceIntensity(Device device, int intensity)
- syncWithESP32()
- testESP32Connection()
- updateESP32Url(String url)
```

#### ESP32Service

`esp32_service.dart` - HTTP communication with ESP32 module

**Responsibilities:**
- Make HTTP requests to ESP32 REST API
- Handle network timeouts and errors
- Format request/response data
- Manage base URL configuration

**Key Methods:**
```dart
- toggleDevice(String deviceId, bool state)
- setDeviceIntensity(String deviceId, int intensity)
- getDevices()
- testConnection()
- updateBaseUrl(String url)
```

### 3. Data Layer (Models)

**Location:** `lib/models/`

Plain Dart classes representing the app's data structures.

#### Models

**Device** (`device.dart`)
- Represents a controllable appliance
- Properties: id, name, type, roomId, isOn, intensity
- Includes JSON serialization/deserialization

**Room** (`room.dart`)
- Represents a physical room in the home
- Properties: id, name, icon
- Includes JSON serialization/deserialization

**ApplianceType** (`appliance_type.dart`)
- Enum defining device types: light, fan, socket
- Extensions for display names and icons

## State Management

### Provider Pattern

The app uses the Provider package for state management, following these principles:

1. **Single Source of Truth**: DataService holds all app state
2. **Reactive Updates**: UI automatically rebuilds on state changes
3. **Decoupled Architecture**: Business logic separated from UI

```dart
ChangeNotifierProvider(
  create: (context) => DataService(),
  child: MaterialApp(...)
)
```

Screens consume state using:
```dart
Consumer<DataService>(
  builder: (context, dataService, child) {
    // Use dataService.rooms, dataService.devices, etc.
  }
)
```

## Data Flow

```
User Action (UI)
    ↓
Widget Event Handler
    ↓
DataService Method
    ↓
ESP32Service HTTP Request
    ↓
ESP32 Module
    ↓
HTTP Response
    ↓
DataService State Update
    ↓
notifyListeners()
    ↓
UI Rebuild (Consumer)
```

## Communication Protocol

### Flutter App ↔ ESP32

**Protocol:** HTTP REST API over Wi-Fi

**Default URL:** `http://192.168.4.1`

**Endpoints:**
- `GET /api/devices` - Fetch all device states
- `POST /api/device/{id}/toggle` - Toggle device on/off
- `POST /api/device/{id}/intensity` - Set device intensity
- `GET /api/status` - Health check

**Timeout:** 5 seconds per request

**Error Handling:**
- Network errors are caught and logged
- UI still updates optimistically for better UX
- Error messages displayed to user when appropriate

## Persistence

**SharedPreferences** is used for storing:
- ESP32 base URL configuration
- User preferences (future)

```dart
final prefs = await SharedPreferences.getInstance();
await prefs.setString('esp32_url', url);
```

## Navigation

Flutter's built-in Navigator for screen transitions:

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => RoomDetailsScreen(room: room)),
);
```

Simple navigation stack:
- HomeScreen (root)
  - RoomDetailsScreen
  - SettingsScreen

## Error Handling Strategy

1. **Network Errors**: 
   - Caught in ESP32Service
   - Logged to console
   - Graceful fallback (optimistic UI updates)
   - User notification via snackbars

2. **Validation Errors**:
   - Input validation in UI
   - Clear error messages
   - Prevent invalid states

3. **State Errors**:
   - Null-safe Dart
   - Default values for optional fields
   - Defensive programming

## Testing Strategy

### Unit Tests
- Model serialization/deserialization
- Business logic in DataService
- ESP32Service request formatting

### Widget Tests
- Individual widget behavior
- User interaction flows
- State changes

### Integration Tests (Future)
- End-to-end user flows
- ESP32 communication
- Navigation flows

## Extensibility Points

The architecture is designed to be easily extended:

### 1. Adding New Device Types

```dart
// In appliance_type.dart
enum ApplianceType {
  light,
  fan,
  socket,
  thermostat,  // New type
}
```

### 2. Adding New Screens

Create new screen file in `lib/screens/` and add navigation from existing screens.

### 3. Adding Voice Control

Create new service:
```dart
class VoiceControlService {
  Future<void> processVoiceCommand(String command) {
    // Parse command and call DataService methods
  }
}
```

### 4. Adding Scenes

New model:
```dart
class Scene {
  final String id;
  final String name;
  final List<DeviceState> deviceStates;
}
```

New methods in DataService:
```dart
Future<void> activateScene(Scene scene) {
  // Apply all device states in the scene
}
```

### 5. Adding Cloud Sync

New service:
```dart
class CloudSyncService {
  Future<void> syncToCloud() {
    // Upload configuration to cloud
  }
  
  Future<void> syncFromCloud() {
    // Download configuration from cloud
  }
}
```

## Performance Considerations

1. **Optimistic UI Updates**: UI updates immediately, ESP32 request happens in background
2. **Minimal Rebuilds**: Consumer widgets only rebuild affected parts
3. **Lazy Loading**: Devices loaded per room, not all at once
4. **Debouncing**: Slider changes could be debounced (future improvement)
5. **Caching**: ESP32 URL cached in SharedPreferences

## Security Considerations

**Current State:**
- No authentication (suitable for local network only)
- HTTP (not HTTPS) for ESP32 communication
- No data encryption

**Future Improvements:**
- Token-based authentication
- HTTPS with self-signed certificates
- End-to-end encryption
- User access control
- Secure storage for credentials

## Deployment

### Android
- Minimum SDK: 21 (Android 5.0)
- Target SDK: 34
- Permissions: INTERNET, ACCESS_NETWORK_STATE

### iOS
- Minimum iOS: 11.0
- Required: Network permissions in Info.plist

### Web
- Modern browsers with JavaScript enabled
- Local network access for ESP32 communication

## Dependencies

### Production
- `flutter`: Framework
- `provider`: State management
- `http`: HTTP client
- `shared_preferences`: Local storage
- `cupertino_icons`: iOS icons

### Development
- `flutter_test`: Testing framework
- `flutter_lints`: Code analysis

## Code Style

- **Language**: Dart 3.0+
- **Style Guide**: Official Dart style guide
- **Linting**: flutter_lints package
- **Formatting**: `dart format`
- **Documentation**: Inline comments for complex logic only

## Future Architecture Enhancements

1. **Repository Pattern**: Abstract data sources (local/remote)
2. **Dependency Injection**: Use get_it for service location
3. **BLoC Pattern**: For more complex state management
4. **Offline Support**: Local database with sqflite
5. **Reactive Streams**: Use RxDart for complex async flows
6. **API Versioning**: Support multiple ESP32 firmware versions