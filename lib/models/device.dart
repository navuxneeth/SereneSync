import 'appliance_type.dart';

class Device {
  final String id;
  final String name;
  final ApplianceType type;
  final String roomId;
  bool isOn;
  int? intensity; // For dimmable lights or fan speed (0-100)

  Device({
    required this.id,
    required this.name,
    required this.type,
    required this.roomId,
    this.isOn = false,
    this.intensity,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.name,
      'roomId': roomId,
      'isOn': isOn,
      'intensity': intensity,
    };
  }

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'] as String,
      name: json['name'] as String,
      type: ApplianceType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => ApplianceType.socket,
      ),
      roomId: json['roomId'] as String,
      isOn: json['isOn'] as bool? ?? false,
      intensity: json['intensity'] as int?,
    );
  }

  Device copyWith({
    String? id,
    String? name,
    ApplianceType? type,
    String? roomId,
    bool? isOn,
    int? intensity,
  }) {
    return Device(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      roomId: roomId ?? this.roomId,
      isOn: isOn ?? this.isOn,
      intensity: intensity ?? this.intensity,
    );
  }
}
