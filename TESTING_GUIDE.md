# Testing Guide for SereneSync

This document outlines how to test all features of the SereneSync app to ensure everything works correctly.

## 🧪 Pre-Testing Setup

Before you start testing, make sure:
1. Flutter is installed and configured (`flutter doctor`)
2. Dependencies are installed (`flutter pub get`)
3. You have a test device/emulator or Chrome browser ready

## 🚀 Running the App

```bash
# For web (easiest)
flutter run -d chrome

# For Android emulator
flutter run -d emulator-5554

# For iOS simulator (macOS only)
flutter run -d iPhone
```

## ✅ Testing Checklist

### 1. First Launch & Welcome Screen

**Test Case 1.1: Welcome Screen Display**
- [ ] App launches without errors
- [ ] Welcome screen is displayed (not home screen)
- [ ] Welcome message is visible
- [ ] ESP32 configuration card is shown
- [ ] "What's Next?" section is visible

**Test Case 1.2: ESP32 Connection**
- [ ] Enter a valid ESP32 URL (e.g., `http://192.168.1.100`)
- [ ] Click "Test Connection"
- [ ] Loading indicator appears
- [ ] Connection status is displayed (success or failure message)
- [ ] "Continue to App" button becomes enabled after test

**Test Case 1.3: Skip ESP32 Setup**
- [ ] Can continue without successful ESP32 connection
- [ ] Warning message is displayed
- [ ] App proceeds to home screen

### 2. Home Screen - Empty State

**Test Case 2.1: Empty Home Display**
- [ ] Home screen shows "No rooms yet" message
- [ ] Empty state icon is visible
- [ ] "Add Room" button is displayed
- [ ] Theme toggle icon is in app bar
- [ ] Settings icon is in app bar

**Test Case 2.2: Navigation from Empty State**
- [ ] Clicking "Add Room" button opens manage rooms screen
- [ ] Back button returns to home screen

### 3. Room Management

**Test Case 3.1: Access Room Management**
- [ ] Tap house icon (🏠) in home screen
- [ ] Manage Rooms screen opens
- [ ] "Add Room" FAB is visible

**Test Case 3.2: Create Room**
- [ ] Tap "Add Room" FAB
- [ ] Dialog opens with name field and icon grid
- [ ] Enter room name (e.g., "Living Room")
- [ ] Select an icon from the grid
- [ ] Selected icon is highlighted
- [ ] Tap "Add" button
- [ ] Dialog closes
- [ ] New room appears in list
- [ ] Room count updates

**Test Case 3.3: Create Multiple Rooms**
- [ ] Add at least 3 different rooms with different icons
- [ ] Each room appears correctly in the list
- [ ] All rooms show "0 devices" initially

**Test Case 3.4: Edit Room**
- [ ] Tap edit icon on a room
- [ ] Dialog shows current room name and icon
- [ ] Change the room name
- [ ] Change the icon
- [ ] Tap "Save"
- [ ] Changes are reflected in the list

**Test Case 3.5: Delete Room**
- [ ] Tap delete icon on a room
- [ ] Confirmation dialog appears
- [ ] Warning about deleting devices is shown
- [ ] Tap "Cancel" - room is not deleted
- [ ] Tap delete icon again
- [ ] Tap "Delete" - room is removed from list

**Test Case 3.6: Room Persistence**
- [ ] Close the app completely
- [ ] Reopen the app
- [ ] Home screen shows (not welcome screen)
- [ ] All created rooms are still there

### 4. Device Management

**Test Case 4.1: Access Device Management**
- [ ] Tap devices icon in home screen
- [ ] Manage Devices screen opens
- [ ] "Add Device" FAB is visible

**Test Case 4.2: Create Light Device**
- [ ] Tap "Add Device" FAB
- [ ] Dialog opens
- [ ] Enter device name (e.g., "Ceiling Light")
- [ ] Enter device ID (e.g., "light_001")
- [ ] Select a room from dropdown
- [ ] Select "Light" type (💡)
- [ ] Tap "Add"
- [ ] Device appears in list with correct room and type

**Test Case 4.3: Create Fan Device**
- [ ] Add device with type "Fan" (🌀)
- [ ] Device appears with fan icon

**Test Case 4.4: Create Socket Device**
- [ ] Add device with type "Socket" (🔌)
- [ ] Device appears with socket icon

**Test Case 4.5: Create Multiple Devices**
- [ ] Add 2-3 devices to each room
- [ ] All devices appear correctly
- [ ] Device count per room is accurate

**Test Case 4.6: Edit Device**
- [ ] Tap edit icon on a device
- [ ] Dialog shows current values
- [ ] Device ID field is disabled
- [ ] Change device name
- [ ] Change room assignment
- [ ] Change device type
- [ ] Tap "Save"
- [ ] Changes are reflected

**Test Case 4.7: Delete Device**
- [ ] Tap delete icon on a device
- [ ] Confirmation dialog appears
- [ ] Tap "Cancel" - device is not deleted
- [ ] Tap delete again and confirm
- [ ] Device is removed from list
- [ ] Room's device count decreases

**Test Case 4.8: Device Persistence**
- [ ] Close and reopen app
- [ ] All devices are still there
- [ ] Device states are preserved

### 5. Home Screen - With Rooms and Devices

**Test Case 5.1: Room Cards Display**
- [ ] Home screen shows grid of room cards
- [ ] Each card shows room icon and name
- [ ] Each card shows device count
- [ ] Each card shows active device count

**Test Case 5.2: Quick Stats**
- [ ] Quick stats card is displayed at bottom
- [ ] Total devices count is accurate
- [ ] Active devices count is accurate (should be 0 initially)

**Test Case 5.3: Footer**
- [ ] Footer is visible at the bottom
- [ ] "Made by Navaneeth Sankar K P" text is shown
- [ ] LinkedIn link is present and clickable
- [ ] Clicking link opens LinkedIn profile in browser

### 6. Room Details & Device Control

**Test Case 6.1: Open Room Details**
- [ ] Tap on a room card
- [ ] Room details screen opens
- [ ] Room name is shown in app bar
- [ ] All devices in room are displayed
- [ ] "Turn All On/Off" buttons are visible

**Test Case 6.2: Toggle Device On**
- [ ] Tap switch for a light/fan device
- [ ] Switch animates to ON position
- [ ] Slider appears for intensity control
- [ ] Slider shows default intensity value

**Test Case 6.3: Adjust Device Intensity**
- [ ] While device is ON, move the slider
- [ ] Intensity value updates in real-time
- [ ] Slider animates smoothly

**Test Case 6.4: Toggle Device Off**
- [ ] Tap switch to turn device OFF
- [ ] Switch animates to OFF position
- [ ] Slider disappears

**Test Case 6.5: Socket Device (No Intensity)**
- [ ] Toggle a socket device ON
- [ ] No slider appears (sockets don't have intensity)
- [ ] Toggle OFF works correctly

**Test Case 6.6: Turn All On**
- [ ] Tap "Turn All On" button
- [ ] All devices in room turn ON
- [ ] Sliders appear for lights and fans
- [ ] Active device count increases

**Test Case 6.7: Turn All Off**
- [ ] Tap "Turn All Off" button
- [ ] All devices turn OFF
- [ ] All sliders disappear
- [ ] Active device count decreases

**Test Case 6.8: Pull to Refresh**
- [ ] Swipe down on room details
- [ ] Refresh indicator appears
- [ ] Attempt to sync with ESP32 (will show error if no ESP32)
- [ ] Indicator disappears after sync attempt

**Test Case 6.9: Navigation**
- [ ] Back button returns to home screen
- [ ] Device states are preserved
- [ ] Active count on room card is updated

### 7. Theme Switching

**Test Case 7.1: Toggle Dark Mode from Home**
- [ ] Tap theme toggle icon (moon/sun) in home screen app bar
- [ ] App transitions to dark theme
- [ ] All screens use dark theme
- [ ] Icon changes to indicate current theme

**Test Case 7.2: Toggle from Settings**
- [ ] Go to Settings
- [ ] Find "Dark Mode" switch
- [ ] Toggle the switch
- [ ] Theme changes throughout app
- [ ] Switch state reflects current theme

**Test Case 7.3: Theme Persistence**
- [ ] Set app to dark mode
- [ ] Close app completely
- [ ] Reopen app
- [ ] App opens in dark mode
- [ ] Toggle to light mode
- [ ] Close and reopen
- [ ] App opens in light mode

**Test Case 7.4: Visual Verification**
- [ ] Dark mode has dark backgrounds
- [ ] Text is readable in dark mode
- [ ] Icons are visible in both themes
- [ ] Cards and buttons have appropriate contrast
- [ ] No visual glitches during transition

### 8. Settings Screen

**Test Case 8.1: Access Settings**
- [ ] Tap settings icon (⚙️) in home screen
- [ ] Settings screen opens

**Test Case 8.2: ESP32 Configuration**
- [ ] Current ESP32 URL is displayed
- [ ] Can edit the URL
- [ ] Tap "Test" to test connection
- [ ] Connection status is shown
- [ ] Tap "Save" to store URL
- [ ] Success message is displayed

**Test Case 8.3: Theme Toggle**
- [ ] Dark mode switch is present
- [ ] Switch reflects current theme
- [ ] Toggle works correctly
- [ ] Theme changes immediately

**Test Case 8.4: About Dialog**
- [ ] Tap "About" option
- [ ] About dialog opens
- [ ] Shows app name and version
- [ ] Shows feature list
- [ ] Close dialog works

**Test Case 8.5: Sync with ESP32**
- [ ] Tap "Sync with ESP32" option
- [ ] Loading indicator appears (if any)
- [ ] Success or error message shown
- [ ] Returns to settings screen

**Test Case 8.6: Footer**
- [ ] Footer is visible
- [ ] LinkedIn link works

### 9. Data Persistence

**Test Case 9.1: Complete Data Persistence**
- [ ] Create rooms and devices
- [ ] Toggle some devices ON
- [ ] Adjust some intensities
- [ ] Switch to dark mode
- [ ] Close app completely (force quit)
- [ ] Reopen app
- [ ] All rooms are present
- [ ] All devices are present
- [ ] Device states (on/off) are preserved
- [ ] Intensity values are preserved
- [ ] Theme preference is preserved
- [ ] ESP32 URL is preserved

### 10. ESP32 Integration (If Available)

**Test Case 10.1: Connect to Real ESP32**
- [ ] Have ESP32 running with required API endpoints
- [ ] Enter ESP32 IP in settings
- [ ] Test connection - should succeed
- [ ] Save connection

**Test Case 10.2: Device Control via ESP32**
- [ ] Toggle a device ON
- [ ] Verify ESP32 receives the command
- [ ] Physical device turns ON
- [ ] Toggle device OFF
- [ ] Physical device turns OFF

**Test Case 10.3: Intensity Control via ESP32**
- [ ] Adjust intensity slider
- [ ] ESP32 receives intensity value
- [ ] Physical device brightness/speed changes

**Test Case 10.4: Sync from ESP32**
- [ ] Change device state directly on ESP32
- [ ] Pull to refresh in app
- [ ] App updates to match ESP32 state

### 11. Edge Cases & Error Handling

**Test Case 11.1: Empty Field Validation**
- [ ] Try to create room without name - should show error
- [ ] Try to create device without name - should show error
- [ ] Try to create device without ID - should show error

**Test Case 11.2: Network Error Handling**
- [ ] Enter invalid ESP32 URL
- [ ] Test connection
- [ ] Error message is clear and helpful
- [ ] App doesn't crash

**Test Case 11.3: No Rooms Created**
- [ ] Try to add device without any rooms
- [ ] Should show message to create room first

**Test Case 11.4: Delete Room with Devices**
- [ ] Create room with multiple devices
- [ ] Delete room
- [ ] Confirm warning about deleting devices
- [ ] All devices in room are deleted

## 📊 Test Results Template

Copy this for your test report:

```
SereneSync Test Report
Date: [Date]
Tester: [Name]
Platform: [Android/iOS/Web]
Device: [Device Name/Browser]

Test Results:
- Total Test Cases: 100+
- Passed: __
- Failed: __
- Skipped: __

Failed Tests (if any):
1. [Test case ID] - [Description of failure]
2. ...

Notes:
[Any additional observations]
```

## 🐛 Common Issues to Watch For

1. **Memory Leaks**: Watch for increasing memory usage
2. **State Consistency**: Device states should match between screens
3. **Animation Glitches**: Smooth transitions without jank
4. **Persistence**: Data survives app restarts
5. **Theme**: No visual issues in either theme
6. **Navigation**: No stuck screens or broken back navigation
7. **Performance**: No lag in UI interactions

## ✅ Sign-Off

All tests passing? Great! The app is ready to use.

Found issues? Document them and fix before release.

---

**Created for SereneSync - Smart Home Automation App**
