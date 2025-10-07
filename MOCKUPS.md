# SereneSync UI Mockups & Screenshots

Visual guide to the SereneSync user interface.

## 📱 Screen Layouts

### 1. Home Screen (Dashboard)

```
┌─────────────────────────────────────┐
│  SereneSync              ⚙️         │
├─────────────────────────────────────┤
│                                     │
│  Your Rooms                         │
│  Manage your smart home devices     │
│                                     │
│  ┌──────────┐  ┌──────────┐       │
│  │  🛋️      │  │  🛏️      │       │
│  │          │  │          │       │
│  │ Living   │  │ Bedroom  │       │
│  │ Room     │  │          │       │
│  │ 3 devices│  │ 3 devices│       │
│  │ 2 ON     │  │ 0 ON     │       │
│  └──────────┘  └──────────┘       │
│                                     │
│  ┌──────────┐  ┌──────────┐       │
│  │  🍳      │  │  🚿      │       │
│  │          │  │          │       │
│  │ Kitchen  │  │ Bathroom │       │
│  │ 2 devices│  │ 1 device │       │
│  │ 1 ON     │  │ 0 ON     │       │
│  └──────────┘  └──────────┘       │
│                                     │
│  ┌─────────────────────────────┐  │
│  │  📱      │      ⚡           │  │
│  │  Total   │      Active      │  │
│  │  Devices │      Devices     │  │
│  │    9     │        3         │  │
│  └─────────────────────────────┘  │
│                                     │
└─────────────────────────────────────┘
```

**Key Elements:**
- Top app bar with title and settings icon
- Room grid (2 columns)
- Each room card shows:
  - Large emoji icon
  - Room name
  - Device count
  - Active device badge (green)
- Quick stats panel at bottom
- Material Design 3 styling
- Pull-to-refresh capability

---

### 2. Room Details Screen

```
┌─────────────────────────────────────┐
│  ← Living Room                      │
├─────────────────────────────────────┤
│                                     │
│         🛋️                          │
│                                     │
│      2 of 3 devices active          │
│                                     │
│    [ 🔴 Turn All Off ]              │
│                                     │
├─────────────────────────────────────┤
│                                     │
│  ┌─────────────────────────────┐  │
│  │ 💡 Ceiling Light            │  │
│  │    Light                    │  │
│  │                      [ON ▣] │  │
│  │ ┌──────────────────────┐   │  │
│  │ │🔆 ▬▬▬▬▬▬●▬▬▬▬ 80%    │   │  │
│  │ └──────────────────────┘   │  │
│  └─────────────────────────────┘  │
│                                     │
│  ┌─────────────────────────────┐  │
│  │ 🌀 Ceiling Fan              │  │
│  │    Fan                      │  │
│  │                      [ON ▣] │  │
│  │ ┌──────────────────────┐   │  │
│  │ │⚡ ▬▬▬▬▬●▬▬▬▬▬ 60%    │   │  │
│  │ └──────────────────────┘   │  │
│  └─────────────────────────────┘  │
│                                     │
│  ┌─────────────────────────────┐  │
│  │ 🔌 TV Socket                │  │
│  │    Socket                   │  │
│  │                      [OFF ▢] │  │
│  └─────────────────────────────┘  │
│                                     │
└─────────────────────────────────────┘
```

**Key Elements:**
- Back button and room name
- Large room icon header
- Status summary
- "Turn All On/Off" master control
- Device cards with:
  - Device icon and name
  - Device type label
  - On/off switch
  - Intensity slider (when ON)
- Scrollable list
- Empty state message if no devices

---

### 3. Settings Screen

```
┌─────────────────────────────────────┐
│  ← Settings                         │
├─────────────────────────────────────┤
│                                     │
│  ┌─────────────────────────────┐  │
│  │ 📶 ESP32 Configuration      │  │
│  │                              │  │
│  │ ESP32 URL                    │  │
│  │ ┌────────────────────────┐  │  │
│  │ │🔗 http://192.168.4.1  │  │  │
│  │ └────────────────────────┘  │  │
│  │                              │  │
│  │ Enter the IP address or      │  │
│  │ hostname of your ESP32       │  │
│  │                              │  │
│  │ [ 💾 Save ]  [ 📡 Test ]    │  │
│  │                              │  │
│  │ ✅ Connected successfully!   │  │
│  │                              │  │
│  └─────────────────────────────┘  │
│                                     │
│  ┌─────────────────────────────┐  │
│  │ ℹ️  About               ›    │  │
│  │    SereneSync v1.0.0         │  │
│  ├─────────────────────────────┤  │
│  │ 🔄 Sync with ESP32      ›    │  │
│  │    Fetch latest states       │  │
│  └─────────────────────────────┘  │
│                                     │
└─────────────────────────────────────┘
```

**Key Elements:**
- ESP32 configuration card
- URL input field with placeholder
- Save and Test buttons (side by side)
- Connection status indicator
- About option
- Sync option
- List tiles with icons
- Clean, organized layout

---

## 🎨 Color Palette

### Primary Colors
- **Primary Blue**: `#0175C2` - Main accent color
- **Primary Light**: `#4FA5D5` - Lighter variant
- **Primary Dark**: `#014F87` - Darker variant

### Status Colors
- **Success Green**: `#4CAF50` - Active/success states
- **Warning Orange**: `#FF9800` - Warnings
- **Error Red**: `#F44336` - Errors
- **Info Blue**: `#2196F3` - Information

### Neutral Colors
- **Background**: `#FFFFFF` - Main background
- **Surface**: `#F5F5F5` - Card backgrounds
- **Border**: `#E0E0E0` - Dividers/borders
- **Text Primary**: `#212121` - Main text
- **Text Secondary**: `#757575` - Secondary text

### Semantic Colors
- **Active Badge**: `#4CAF50` with 20% opacity background
- **Card Shadow**: `rgba(0, 0, 0, 0.1)` - Subtle elevation

---

## 🎭 UI States

### Device Control States

#### OFF State
```
┌─────────────────────────────┐
│ 💡 Ceiling Light            │
│    Light                    │
│                      [OFF ▢] │
└─────────────────────────────┘
```

#### ON State (without intensity)
```
┌─────────────────────────────┐
│ 🔌 TV Socket                │
│    Socket                   │
│                      [ON ▣]  │
└─────────────────────────────┘
```

#### ON State (with intensity)
```
┌─────────────────────────────┐
│ 💡 Ceiling Light            │
│    Light                    │
│                      [ON ▣]  │
│ ┌──────────────────────┐   │
│ │🔆 ▬▬▬▬▬▬●▬▬▬▬ 80%    │   │
│ └──────────────────────┘   │
└─────────────────────────────┘
```

### Connection Status

#### Testing Connection
```
┌─────────────────────────────┐
│ [ 💾 Save ]  [ ⏳ Test ]    │
└─────────────────────────────┘
```

#### Success
```
┌─────────────────────────────┐
│ ✅ Connected successfully!   │
└─────────────────────────────┘
```

#### Failure
```
┌─────────────────────────────┐
│ ❌ Connection failed. Please │
│    check the URL...          │
└─────────────────────────────┘
```

### Room Card States

#### No Active Devices
```
┌──────────┐
│  🛏️      │
│          │
│ Bedroom  │
│ 3 devices│
└──────────┘
```

#### With Active Devices
```
┌──────────┐
│  🛋️  2 ON│
│          │
│ Living   │
│ Room     │
│ 3 devices│
└──────────┘
```

---

## 📐 Layout Specifications

### Grid Layout (Home Screen)
- **Columns**: 2
- **Aspect Ratio**: 1.2 (width:height)
- **Cross Spacing**: 16px
- **Main Spacing**: 16px
- **Padding**: 16px all sides

### Card Specifications
- **Border Radius**: 12-16px
- **Elevation**: 2-4dp
- **Padding**: 16-20px
- **Margin**: 8-12px between cards

### Typography
- **App Title**: 20px, Bold
- **Section Headers**: 24px, Bold
- **Room Names**: 18px, Bold
- **Device Names**: 16px, Bold
- **Labels**: 14px, Regular
- **Captions**: 12px, Regular

### Spacing System
- **XXS**: 4px
- **XS**: 8px
- **S**: 12px
- **M**: 16px
- **L**: 20px
- **XL**: 24px
- **XXL**: 32px

---

## 🎬 Animations

### Switch Toggle
```
OFF [▢] → [⟨==] → [==⟩] → [▣] ON
Duration: 200ms
Curve: easeInOut
```

### Slider Movement
```
●▬▬▬▬▬ → ▬●▬▬▬▬ → ▬▬●▬▬▬ → ▬▬▬●▬▬
Duration: Instant (follows finger)
Haptic: On release
```

### Screen Transition
```
Screen A [====] → [===▶] → [▶===] → [====] Screen B
Duration: 300ms
Curve: easeInOut
Type: Slide left/right
```

### Pull to Refresh
```
↓ Pull Down
  [◌]
  [◔]
  [◑]
  [◕]
  [⟳] Spinning
  [✓] Complete
Duration: 300ms + API time
```

---

## 🖼️ Icon Usage

### Device Icons
- 💡 **Light**: All lighting devices
- 🌀 **Fan**: All fan devices
- 🔌 **Socket**: All outlet devices

### Room Icons
- 🛋️ **Living Room**: Main living space
- 🛏️ **Bedroom**: Sleeping areas
- 🍳 **Kitchen**: Cooking/dining
- 🚿 **Bathroom**: Personal care

### Action Icons
- ⚙️ **Settings**: Configuration
- 🔄 **Sync**: Refresh/update
- 💾 **Save**: Store changes
- 📡 **Test**: Verify connection
- ℹ️ **About**: Information
- ✓ **Success**: Confirmed
- ✗ **Error**: Failed
- ⟳ **Loading**: In progress

### Status Icons
- 📱 **Devices**: Total count
- ⚡ **Active**: Power status
- 🔆 **Brightness**: Light intensity
- ⚡ **Speed**: Fan speed
- 🔗 **Link**: URL/connection
- 📶 **WiFi**: Network status

---

## 📱 Responsive Breakpoints

### Small Phone (< 360dp)
- Single column grid
- Smaller text sizes
- Compact spacing

### Standard Phone (360-600dp)
- 2 column grid
- Standard text sizes
- Normal spacing

### Large Phone/Small Tablet (600-840dp)
- 3 column grid
- Slightly larger text
- Generous spacing

### Tablet (> 840dp)
- 4 column grid
- Larger text sizes
- Maximum spacing

---

## 🎯 Touch Targets

### Minimum Sizes
- **Buttons**: 48x48 dp
- **Switches**: 48x48 dp
- **Cards**: 120x120 dp minimum
- **List Items**: 48 dp height

### Padding for Touch
- **Around buttons**: 8dp minimum
- **Between controls**: 16dp
- **Card edges**: 16dp

---

## 🌈 Theme Variations

### Light Theme (Current)
- White background
- Dark text
- Blue accents
- Subtle shadows

### Dark Theme (Planned)
- Dark background (#121212)
- Light text (#FFFFFF)
- Blue accents (lighter)
- Elevated surfaces

---

## 📸 Sample Screenshots

### Screenshot Descriptions

**Home_Screen_Empty.png**
- Shows 4 room cards
- All devices OFF
- Stats showing 0 active

**Home_Screen_Active.png**
- Shows 4 room cards
- 3 devices ON in living room
- Green badges visible
- Stats showing activity

**Room_Details_LivingRoom.png**
- Living room with 3 devices
- 2 devices ON with sliders
- 1 device OFF
- "Turn All Off" button visible

**Room_Details_Empty.png**
- Room with no devices
- Empty state illustration
- Helpful message

**Settings_Configured.png**
- ESP32 URL filled in
- Green success message
- All settings visible

**Settings_Testing.png**
- Test button with spinner
- URL entered
- Waiting for result

---

## 🎨 Design Philosophy

### Principles
1. **Simplicity**: Easy to understand and use
2. **Clarity**: Clear visual hierarchy
3. **Consistency**: Uniform patterns throughout
4. **Feedback**: Immediate response to actions
5. **Accessibility**: Readable, touchable, navigable

### Material Design 3
- Modern, clean aesthetic
- Dynamic color system
- Consistent spacing
- Proper elevation
- Smooth animations

### User Experience
- **Task-focused**: Quick device control
- **Forgiving**: Undo-friendly (toggle back)
- **Responsive**: Instant feedback
- **Informative**: Clear status indicators
- **Efficient**: Minimal taps to goal

---

## 🔍 Usability Guidelines

### Do's ✅
- Use large, easy-to-tap controls
- Provide immediate visual feedback
- Show clear status indicators
- Use familiar icons and patterns
- Keep important actions visible

### Don'ts ❌
- Don't hide critical functions
- Don't use tiny touch targets
- Don't delay visual feedback
- Don't use unclear icons
- Don't overwhelm with options

---

This mockup guide represents the current implementation. Actual screenshots would show the live Flutter application with Material Design 3 styling.