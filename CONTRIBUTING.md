# Contributing to SereneSync

First off, thank you for considering contributing to SereneSync! It's people like you that make SereneSync such a great tool for smart home automation.

## Table of Contents

1. [Code of Conduct](#code-of-conduct)
2. [Getting Started](#getting-started)
3. [How Can I Contribute?](#how-can-i-contribute)
4. [Development Process](#development-process)
5. [Style Guidelines](#style-guidelines)
6. [Commit Messages](#commit-messages)
7. [Pull Request Process](#pull-request-process)

## Code of Conduct

This project and everyone participating in it is governed by common sense and mutual respect. We expect all contributors to:

- Be respectful and inclusive
- Accept constructive criticism gracefully
- Focus on what's best for the community
- Show empathy towards other community members

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Git
- A code editor (VS Code, Android Studio, or IntelliJ IDEA recommended)
- Basic knowledge of Dart and Flutter

### Setup Development Environment

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/sidegig-thing.git
   cd sidegig-thing
   ```

3. Add the upstream repository:
   ```bash
   git remote add upstream https://github.com/navuxneeth/sidegig-thing.git
   ```

4. Install dependencies:
   ```bash
   flutter pub get
   ```

5. Run the app:
   ```bash
   flutter run
   ```

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates.

**When filing a bug report, include:**

- A clear, descriptive title
- Exact steps to reproduce the problem
- Expected vs actual behavior
- Screenshots (if applicable)
- Flutter version: `flutter --version`
- Device/emulator details
- ESP32 firmware version (if applicable)

**Example Bug Report:**

```markdown
**Title**: Device toggle switch doesn't update after turning on

**Steps to reproduce**:
1. Open Living Room
2. Toggle Ceiling Light on
3. Observe switch state

**Expected**: Switch shows ON state
**Actual**: Switch remains in OFF state

**Environment**:
- Flutter 3.10.5
- Android 13, Pixel 6
- ESP32 firmware v1.0.0
```

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues.

**Include in your suggestion:**

- Clear title and description
- Use case and motivation
- Expected behavior
- Mockups or examples (if applicable)
- Potential implementation approach

### Your First Code Contribution

Unsure where to start? Look for issues labeled:

- `good first issue` - Suitable for newcomers
- `help wanted` - Need community input
- `documentation` - Documentation improvements

### Pull Requests

1. Create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes following our [Style Guidelines](#style-guidelines)

3. Test your changes:
   ```bash
   flutter analyze
   flutter test
   flutter run
   ```

4. Commit with a descriptive message:
   ```bash
   git commit -m "Add feature: your feature description"
   ```

5. Push to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

6. Open a Pull Request on GitHub

## Development Process

### Branching Strategy

- `main` - Stable production code
- `feature/*` - New features
- `fix/*` - Bug fixes
- `docs/*` - Documentation updates
- `refactor/*` - Code refactoring

### Testing

Before submitting, ensure:

1. **Unit Tests Pass**:
   ```bash
   flutter test
   ```

2. **Code Analysis Passes**:
   ```bash
   flutter analyze
   ```

3. **App Runs Successfully**:
   ```bash
   flutter run
   ```

4. **Manual Testing**:
   - Test affected features
   - Test on multiple screen sizes
   - Verify no regressions

### Adding New Features

When adding a feature:

1. **Update Documentation**:
   - Add to README.md if user-facing
   - Update ARCHITECTURE.md if architectural
   - Add code comments for complex logic

2. **Write Tests**:
   - Unit tests for models and services
   - Widget tests for UI components

3. **Consider Extensibility**:
   - Will this work with future features?
   - Is it maintainable?
   - Does it follow existing patterns?

## Style Guidelines

### Dart Code Style

Follow the [Official Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).

**Key Points**:

- Use `dart format` before committing
- Maximum line length: 80 characters
- Use `const` constructors where possible
- Prefer `final` over `var` when type is known
- Use trailing commas for better formatting

**Example**:

```dart
class Device {
  final String id;
  final String name;
  final ApplianceType type;
  
  const Device({
    required this.id,
    required this.name,
    required this.type,
  });
}
```

### File Organization

```dart
// 1. Imports - Dart SDK first
import 'dart:async';

// 2. Flutter packages
import 'package:flutter/material.dart';

// 3. Third-party packages
import 'package:provider/provider.dart';

// 4. Local imports
import '../models/device.dart';
import '../services/data_service.dart';
```

### Naming Conventions

- **Classes**: `PascalCase` (e.g., `DeviceControl`)
- **Files**: `snake_case` (e.g., `device_control.dart`)
- **Variables**: `camelCase` (e.g., `deviceId`)
- **Constants**: `camelCase` with `const` (e.g., `const maxDevices`)
- **Private**: Prefix with `_` (e.g., `_privateMethod`)

### Comments

- Use comments sparingly - code should be self-documenting
- Add comments for complex logic or non-obvious decisions
- Use `///` for public API documentation
- Use `//` for inline comments

```dart
/// Toggles the device state and notifies listeners.
/// 
/// Returns true if the operation succeeded, false otherwise.
Future<bool> toggleDevice(Device device) async {
  // Update local state optimistically for better UX
  device.isOn = !device.isOn;
  notifyListeners();
  
  // Send command to ESP32
  return await _esp32Service.toggle(device.id, device.isOn);
}
```

### Widget Guidelines

- Keep widgets small and focused
- Extract reusable components
- Use `const` constructors for static widgets
- Prefer composition over inheritance

```dart
// Good: Small, focused widget
class DeviceCard extends StatelessWidget {
  final Device device;
  
  const DeviceCard({super.key, required this.device});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(device.name),
        trailing: Switch(
          value: device.isOn,
          onChanged: (_) => _toggleDevice(),
        ),
      ),
    );
  }
}
```

## Commit Messages

### Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, no logic change)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

### Examples

```
feat(devices): add support for thermostat control

Implement thermostat device type with temperature control.
Includes UI slider for temperature adjustment.

Closes #42
```

```
fix(settings): resolve ESP32 connection timeout issue

Increase timeout from 3s to 5s to accommodate slower networks.

Fixes #38
```

```
docs(readme): update installation instructions

Add troubleshooting section for common setup issues.
```

## Pull Request Process

### Before Submitting

- [ ] Code follows style guidelines
- [ ] All tests pass
- [ ] New tests added for new features
- [ ] Documentation updated
- [ ] Commits are atomic and well-described
- [ ] Branch is up to date with main

### PR Description Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
How was this tested?

## Screenshots
(if applicable)

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Comments added for complex code
- [ ] Documentation updated
- [ ] Tests pass
- [ ] No new warnings
```

### Review Process

1. **Automated Checks**: CI will run tests and linting
2. **Code Review**: Maintainer will review code
3. **Discussion**: Address feedback and make changes
4. **Approval**: Once approved, PR will be merged
5. **Thanks**: Your contribution will be acknowledged! 🎉

## Project Structure for Contributors

```
lib/
├── main.dart              # Entry point - rarely needs changes
├── models/                # Add new data models here
├── services/              # Add new services here
│   ├── data_service.dart # Main state management
│   └── esp32_service.dart # ESP32 communication
├── screens/               # Add new screens here
├── widgets/               # Add reusable widgets here
└── utils/                 # Add utility functions (create if needed)

test/
├── models/                # Model tests
├── services/              # Service tests
└── widgets/               # Widget tests
```

## Areas Looking for Contributions

### High Priority
- [ ] Voice control integration
- [ ] Scene management
- [ ] Dark theme
- [ ] Internationalization (i18n)
- [ ] Offline mode with local database

### Medium Priority
- [ ] Energy monitoring dashboard
- [ ] Device scheduling
- [ ] Custom themes
- [ ] More device types (thermostats, cameras)
- [ ] Notification system

### Documentation
- [ ] Video tutorials
- [ ] More screenshots
- [ ] ESP32 firmware examples
- [ ] Architecture diagrams
- [ ] API documentation

## Questions?

Feel free to:
- Open an issue for discussion
- Tag maintainers in comments
- Join our community discussions

## Recognition

Contributors will be:
- Listed in README.md
- Mentioned in release notes
- Credited in commit messages

Thank you for contributing to SereneSync! 🏠✨
