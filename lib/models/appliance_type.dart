enum ApplianceType {
  light,
  fan,
  socket,
}

extension ApplianceTypeExtension on ApplianceType {
  String get displayName {
    switch (this) {
      case ApplianceType.light:
        return 'Light';
      case ApplianceType.fan:
        return 'Fan';
      case ApplianceType.socket:
        return 'Socket';
    }
  }

  String get icon {
    switch (this) {
      case ApplianceType.light:
        return '💡';
      case ApplianceType.fan:
        return '🌀';
      case ApplianceType.socket:
        return '🔌';
    }
  }
}
