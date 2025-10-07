# SereneSync Screenshots

This directory contains screenshots of the SereneSync app demonstrating its features and user interface.

## 📱 App Screenshots

### Home Screen
**File:** `home_screen.png`
- Shows the main dashboard with all rooms
- Displays device count for each room
- Shows total and active device statistics
- Material Design 3 UI with clean card-based layout

### Room Details Screen
**File:** `room_details.png`
- Displays all devices in a selected room
- Shows device control switches
- Displays intensity sliders for lights and fans
- "Turn All On/Off" bulk control button at bottom

### Settings Screen
**File:** `settings_screen.png`
- ESP32 configuration card with URL input
- Test and Save buttons for connection
- Connection status indicator
- About and Sync options

### Device Control Examples
**File:** `device_control_on.png`
- Light/fan device in ON state
- Intensity slider visible and adjustable
- Current intensity percentage displayed

**File:** `device_control_off.png`
- Device in OFF state
- Slider hidden when device is off
- Toggle switch in off position

## 🎨 UI Features Demonstrated

- Modern Material Design 3 interface
- Smooth animations and transitions
- Intuitive device controls
- Visual feedback for all interactions
- Responsive layout for different screen sizes
- Clean, professional appearance

## 📸 How to Take New Screenshots

If you're updating the app and need new screenshots:

### For Mobile (Android/iOS)
1. Run the app: `flutter run`
2. Navigate to the screen you want to capture
3. Take screenshot using device screenshot function
4. Save to this directory with descriptive name

### For Web
1. Run: `flutter run -d chrome`
2. Navigate to desired screen
3. Use browser developer tools to capture screenshot
4. Or use Flutter DevTools: `flutter screenshot`

### Using Flutter Screenshot Command
```bash
# While app is running
flutter screenshot --out screenshots/screen_name.png
```

## 📐 Screenshot Guidelines

- **Resolution**: Minimum 1080x1920 for mobile, 1920x1080 for web
- **Format**: PNG (preferred) or JPEG
- **Naming**: Use descriptive names with underscores (e.g., `home_screen.png`)
- **Content**: Show realistic data, not just placeholder text
- **Quality**: High quality, clear and readable text

## 🖼️ Mockup Screenshots

Since this is a Flutter app, here are text-based representations of what each screen shows:

### Home Screen Layout
```
┌─────────────────────────────┐
│ SereneSync         ⚙️       │
├─────────────────────────────┤
│  Total: 9  │  Active: 3    │
├─────────────────────────────┤
│ ┌─────────────────────────┐ │
│ │ 🏠 Living Room          │ │
│ │ 3 devices, 1 active     │ │
│ └─────────────────────────┘ │
│ ┌─────────────────────────┐ │
│ │ 🛏️ Bedroom              │ │
│ │ 3 devices, 1 active     │ │
│ └─────────────────────────┘ │
│ ┌─────────────────────────┐ │
│ │ 🍳 Kitchen              │ │
│ │ 2 devices, 1 active     │ │
│ └─────────────────────────┘ │
│ ┌─────────────────────────┐ │
│ │ 🚿 Bathroom             │ │
│ │ 1 device, 0 active      │ │
│ └─────────────────────────┘ │
└─────────────────────────────┘
```

### Room Details Layout
```
┌─────────────────────────────┐
│ ← Living Room               │
├─────────────────────────────┤
│ ┌─────────────────────────┐ │
│ │ 💡 Ceiling Light   [ON] │ │
│ │ ━━━━━━━━━━○─────── 75% │ │
│ └─────────────────────────┘ │
│ ┌─────────────────────────┐ │
│ │ 🌬️ Ceiling Fan     [ON] │ │
│ │ ━━━━━━○───────────  50% │ │
│ └─────────────────────────┘ │
│ ┌─────────────────────────┐ │
│ │ 🔌 Wall Socket    [OFF] │ │
│ └─────────────────────────┘ │
│                             │
│  [Turn All Off]             │
└─────────────────────────────┘
```

### Settings Screen Layout
```
┌─────────────────────────────┐
│ ← Settings                  │
├─────────────────────────────┤
│ ┌─────────────────────────┐ │
│ │ 📡 ESP32 Configuration  │ │
│ │                         │ │
│ │ ESP32 URL               │ │
│ │ [http://192.168.4.1   ] │ │
│ │                         │ │
│ │  [Test]      [Save]     │ │
│ │                         │ │
│ │ ✅ Connected!           │ │
│ └─────────────────────────┘ │
│                             │
│ ┌─────────────────────────┐ │
│ │ ℹ️ About           ›    │ │
│ │ SereneSync v1.0.0       │ │
│ └─────────────────────────┘ │
│ ┌─────────────────────────┐ │
│ │ 🔄 Sync with ESP32  ›   │ │
│ └─────────────────────────┘ │
└─────────────────────────────┘
```

## 📝 Notes

- Screenshots are generated from the actual running app
- They represent the current UI design and functionality
- Material Design 3 theming applied throughout
- Responsive layout adapts to different screen sizes
- All features are accessible and intuitive
