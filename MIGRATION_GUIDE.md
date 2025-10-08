# Migration Guide - SereneSync v2.0

This guide helps you transition from the old version of SereneSync (with pre-loaded data) to the new customizable version.

## 🔄 What Changed?

### Old Version (v1.0):
- App started with pre-loaded sample data
- 4 hardcoded rooms (Living Room, Bedroom, Kitchen, Bathroom)
- 9 pre-configured devices
- No way to add/edit/delete rooms or devices
- Single theme (light mode only)
- Settings only for ESP32 configuration

### New Version (v2.0):
- App starts with welcome screen
- No pre-loaded data - start from scratch
- Complete room management (create, edit, delete)
- Complete device management (create, edit, delete)
- Light and dark theme support
- Full data persistence
- Professional UI with author attribution

## 📝 Migration Steps

Since the new version uses a completely different data structure and storage mechanism, there's no automatic migration. You'll need to set up your rooms and devices again.

### Step 1: Understand the New Flow

**First Launch:**
1. Welcome screen with ESP32 setup
2. Empty home screen
3. Create rooms manually
4. Add devices manually

### Step 2: Prepare Your Data

Before updating, if you want to keep your setup, note down:

**Your Old Rooms:**
- Room names
- Which devices were in each room

**Your Old Devices:**
- Device names
- Device types (light, fan, socket)
- Device IDs (if you used custom IDs)
- Intensity settings you liked

### Step 3: Update the App

```bash
# Pull the latest changes
git pull origin main

# Install new dependencies
flutter pub get

# Run the app
flutter run
```

### Step 4: Complete Welcome Screen

1. Enter your ESP32 IP address
2. Test the connection
3. Click "Continue to App"

### Step 5: Recreate Your Rooms

For each room you had before:
1. Tap the house icon (🏠) in home screen
2. Tap "Add Room" button
3. Enter the room name (e.g., "Living Room")
4. Choose an icon (🛋️ for living room, 🛏️ for bedroom, etc.)
5. Tap "Add"

**Suggested Icons:**
- Living Room: 🛋️
- Bedroom: 🛏️
- Kitchen: 🍳
- Bathroom: 🚿
- Office: 💼
- Garage: 🚗
- Garden: 🌳
- Dining Room: 🍽️

### Step 6: Recreate Your Devices

For each device you had before:
1. Tap the devices icon in home screen
2. Tap "Add Device" button
3. Enter device name (e.g., "Ceiling Light")
4. Enter device ID (e.g., "lr_light_1")
5. Select the room
6. Select device type (Light, Fan, or Socket)
7. Tap "Add"

**Device ID Format Tips:**
- Use descriptive IDs: `{room}_{type}_{number}`
- Examples:
  - `lr_light_1` (Living Room Light 1)
  - `br_fan_1` (Bedroom Fan 1)
  - `kt_socket_1` (Kitchen Socket 1)

### Step 7: Test Your Setup

1. Go to home screen
2. Tap on a room
3. Toggle a device on/off
4. Adjust intensity if applicable
5. Test ESP32 communication if connected
6. Pull to refresh to sync

### Step 8: Customize

**Try Dark Mode:**
1. Tap the moon icon in home screen
2. Or go to Settings → Toggle "Dark Mode"

**Explore New Features:**
- Edit room names and icons anytime
- Move devices between rooms
- Delete rooms/devices you don't need
- Pull to refresh for ESP32 sync

## 🆚 Feature Comparison

| Feature | Old Version | New Version |
|---------|------------|-------------|
| Pre-loaded Data | ✅ Yes | ❌ No |
| Custom Rooms | ❌ No | ✅ Yes |
| Custom Devices | ❌ No | ✅ Yes |
| Room Icons | ❌ Fixed | ✅ 16+ options |
| Edit Rooms | ❌ No | ✅ Yes |
| Delete Rooms | ❌ No | ✅ Yes |
| Edit Devices | ❌ No | ✅ Yes |
| Delete Devices | ❌ No | ✅ Yes |
| Dark Mode | ❌ No | ✅ Yes |
| Data Persistence | ⚠️ Partial | ✅ Full |
| Welcome Screen | ❌ No | ✅ Yes |
| Empty States | ❌ No | ✅ Yes |
| Footer/Attribution | ❌ No | ✅ Yes |

## 💡 Tips for New Setup

1. **Start Small**: Don't recreate everything at once. Add one room and test it.

2. **Use Descriptive Names**: Since you're creating everything from scratch, use clear, descriptive names.

3. **Organize by Usage**: Create rooms in the order you use them most.

4. **Consistent IDs**: Use a consistent format for device IDs to make ESP32 configuration easier.

5. **Test as You Go**: Test each device after adding it to ensure ESP32 communication works.

6. **Backup Your Setup**: Keep a note of your device IDs somewhere safe.

## 🐛 Troubleshooting

### "I don't see my old data"
This is expected. The new version uses a completely different storage system. You need to recreate your setup.

### "The app looks different"
Yes! The new version has a completely redesigned UI with welcome screen, management screens, and themes.

### "I can't find the sample devices"
Sample devices are gone. You now create your own devices with your own names and IDs.

### "How do I get back the old version?"
If you really need the old version:
```bash
git checkout <old-commit-hash>
flutter pub get
flutter run
```

But we recommend trying the new version - it's much more powerful and customizable!

### "My ESP32 isn't working"
The ESP32 integration hasn't changed. Make sure:
- ESP32 is on the same network
- IP address is correct
- API endpoints are properly configured
- Check [ESP32_API_SPEC.md](ESP32_API_SPEC.md) for details

## 🎓 Learning Resources

To help you get started with the new version:

- **README.md**: Complete setup guide
- **TESTING_GUIDE.md**: Learn all features with 100+ test cases
- **SCREENSHOTS_GUIDE.md**: See what screens look like
- **WHATS_NEW.md**: Detailed list of all new features

## 🤝 Need Help?

If you have questions or issues:
1. Check the [TESTING_GUIDE.md](TESTING_GUIDE.md) for feature documentation
2. Review [README.md](README.md) for setup instructions
3. Open an issue on GitHub
4. Contact via LinkedIn (link in footer)

## ✨ Benefits of New Version

Yes, you have to set things up again, but you gain:
- **Complete Control**: Create exactly what you need
- **Better Organization**: Custom room names and icons
- **More Flexibility**: Edit and delete anything anytime
- **Beautiful Themes**: Light and dark mode support
- **Professional UI**: Polished, modern interface
- **Full Persistence**: Nothing gets lost
- **Better Experience**: Guided setup and helpful empty states

## 🎉 Conclusion

While migration requires manual setup, the new version offers significantly more control and functionality. Take your time setting it up, and you'll end up with a personalized smart home control experience that works exactly the way you want.

Welcome to SereneSync v2.0! 🏠✨

---

**Made with ❤️ by [Navaneeth Sankar K P](https://www.linkedin.com/in/navaneeth-sankar-k-p)**
