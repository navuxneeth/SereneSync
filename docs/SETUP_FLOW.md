# SereneSync Setup Flow

Visual guide to getting started with SereneSync.

## 🎯 Quick Setup Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                     START HERE                                   │
│                                                                   │
│  New to Flutter? → GET_STARTED.md                               │
│  Experienced?    → QUICKSTART.md                                │
│  Need details?   → SETUP.md                                     │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                STEP 1: Install Flutter                           │
│                                                                   │
│  Already have Flutter? Skip this step!                          │
│                                                                   │
│  Windows:  Download from flutter.dev                            │
│  macOS:    brew install flutter                                 │
│  Linux:    git clone flutter repo                               │
│                                                                   │
│  Verify: flutter doctor                                         │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                STEP 2: Get SereneSync                            │
│                                                                   │
│  git clone https://github.com/navuxneeth/SereneSync.git        │
│  cd SereneSync                                                   │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                STEP 3: Run Setup Script                          │
│                                                                   │
│  Option A (Automated):                                          │
│    ./scripts/setup.sh     (Linux/macOS)                        │
│    scripts\setup.bat      (Windows)                             │
│                                                                   │
│  Option B (Manual):                                             │
│    flutter pub get                                              │
│    flutter doctor                                               │
│                                                                   │
│  The script does:                                               │
│  ✓ Checks Flutter installation                                 │
│  ✓ Installs dependencies                                        │
│  ✓ Verifies setup                                              │
│  ✓ Shows available devices                                     │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                STEP 4: Run the App                               │
│                                                                   │
│  Easiest (Web):           flutter run -d chrome                 │
│  Android Device:          flutter run                           │
│  iOS Simulator:           flutter run                           │
│                                                                   │
│  First run takes 2-3 minutes (downloads dependencies)           │
│  Subsequent runs take 5-10 seconds                              │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    SUCCESS! 🎉                                  │
│                                                                   │
│  You should see:                                                │
│  ✓ Home screen with 4 rooms                                    │
│  ✓ 9 pre-configured devices                                    │
│  ✓ Fully interactive controls                                  │
│                                                                   │
│  Try these:                                                     │
│  → Click on a room                                              │
│  → Toggle a device switch                                       │
│  → Adjust a slider                                              │
│  → Open Settings (⚙️ icon)                                      │
└─────────────────────────────────────────────────────────────────┘
```

## 🔄 Development Workflow

```
┌─────────────────────────────────────────────────────────────────┐
│                  One-Time Setup                                  │
│                                                                   │
│  ./scripts/dev-setup.sh                                         │
│                                                                   │
│  This configures your development environment                    │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│              Daily Development Cycle                             │
│                                                                   │
│  1. Start app:      flutter run -d chrome                       │
│  2. Make changes:   Edit code in lib/                           │
│  3. Hot reload:     Press 'r' in terminal                       │
│  4. See changes:    Instant update in app                       │
│  5. Test:           flutter test                                │
│  6. Repeat!                                                     │
│                                                                   │
│  Pro tip: Chrome gives fastest feedback loop!                   │
└─────────────────────────────────────────────────────────────────┘
```

## 🐛 Troubleshooting Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                    Having Issues?                                │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│              Run Verification Script                             │
│                                                                   │
│  ./scripts/verify-setup.sh                                      │
│                                                                   │
│  This checks:                                                    │
│  ✓ Flutter installation                                         │
│  ✓ Flutter version                                              │
│  ✓ Dependencies                                                 │
│  ✓ Project structure                                            │
│  ✓ Available devices                                            │
│  ✓ Code analysis                                                │
│  ✓ Build capability                                             │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                   Common Solutions                               │
│                                                                   │
│  Issue: Flutter not found                                       │
│  Fix:   Install Flutter + add to PATH                           │
│                                                                   │
│  Issue: No devices                                              │
│  Fix:   flutter run -d chrome                                   │
│                                                                   │
│  Issue: Build failed                                            │
│  Fix:   flutter clean && flutter pub get                        │
│                                                                   │
│  Issue: Permission denied                                       │
│  Fix:   chmod +x scripts/*.sh                                   │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                   Still Stuck?                                   │
│                                                                   │
│  → Check SETUP.md troubleshooting section                       │
│  → Read QUICKSTART.md common issues                            │
│  → Open GitHub issue with error details                         │
└─────────────────────────────────────────────────────────────────┘
```

## 📊 Time Estimates

| Task | First Time | Subsequent Times |
|------|-----------|------------------|
| Install Flutter | 10-30 min | - |
| Clone & Setup | 2-5 min | - |
| Run Setup Script | 1-2 min | - |
| First App Run | 2-3 min | 5-10 sec |
| Make Code Change | - | instant (hot reload) |
| Run Tests | - | 10-30 sec |
| Build Release | - | 2-5 min |

**Total first-time setup: 15-40 minutes** (mostly Flutter installation)
**Subsequent runs: Under 1 minute**

## 🎯 Success Criteria

You'll know setup is successful when you can:

- ✅ Run `flutter doctor` without errors
- ✅ Run `flutter run -d chrome` and see the app
- ✅ See 4 rooms on the home screen
- ✅ Click a room and see devices
- ✅ Toggle a device on/off
- ✅ Adjust a slider
- ✅ Navigate to Settings

If all these work, you're ready to use or develop SereneSync! 🎉

## 📚 Related Documentation

- **[GET_STARTED.md](../GET_STARTED.md)** - Beginner guide
- **[SETUP.md](../SETUP.md)** - Comprehensive setup
- **[QUICKSTART.md](../QUICKSTART.md)** - Quick reference
- **[README.md](../README.md)** - Project overview
- **[scripts/README.md](../scripts/README.md)** - Script documentation
