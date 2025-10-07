import 'package:flutter/foundation.dart';
import '../models/room.dart';
import '../models/device.dart';
import '../models/appliance_type.dart';
import 'esp32_service.dart';

class DataService extends ChangeNotifier {
  final ESP32Service _esp32Service = ESP32Service();
  
  List<Room> _rooms = [];
  List<Device> _devices = [];
  bool _isLoading = false;
  String? _error;

  List<Room> get rooms => _rooms;
  List<Device> get devices => _devices;
  bool get isLoading => _isLoading;
  String? get error => _error;
  ESP32Service get esp32Service => _esp32Service;

  DataService() {
    _initializeSampleData();
  }

  // Initialize with sample data for demonstration
  void _initializeSampleData() {
    _rooms = [
      Room(id: '1', name: 'Living Room', icon: '🛋️'),
      Room(id: '2', name: 'Bedroom', icon: '🛏️'),
      Room(id: '3', name: 'Kitchen', icon: '🍳'),
      Room(id: '4', name: 'Bathroom', icon: '🚿'),
    ];

    _devices = [
      // Living Room
      Device(
        id: 'lr_light_1',
        name: 'Ceiling Light',
        type: ApplianceType.light,
        roomId: '1',
        isOn: false,
        intensity: 80,
      ),
      Device(
        id: 'lr_fan_1',
        name: 'Ceiling Fan',
        type: ApplianceType.fan,
        roomId: '1',
        isOn: false,
        intensity: 60,
      ),
      Device(
        id: 'lr_socket_1',
        name: 'TV Socket',
        type: ApplianceType.socket,
        roomId: '1',
        isOn: false,
      ),
      // Bedroom
      Device(
        id: 'br_light_1',
        name: 'Main Light',
        type: ApplianceType.light,
        roomId: '2',
        isOn: false,
        intensity: 70,
      ),
      Device(
        id: 'br_light_2',
        name: 'Bedside Lamp',
        type: ApplianceType.light,
        roomId: '2',
        isOn: false,
        intensity: 40,
      ),
      Device(
        id: 'br_fan_1',
        name: 'Ceiling Fan',
        type: ApplianceType.fan,
        roomId: '2',
        isOn: false,
        intensity: 50,
      ),
      // Kitchen
      Device(
        id: 'kt_light_1',
        name: 'Kitchen Light',
        type: ApplianceType.light,
        roomId: '3',
        isOn: false,
        intensity: 100,
      ),
      Device(
        id: 'kt_socket_1',
        name: 'Refrigerator',
        type: ApplianceType.socket,
        roomId: '3',
        isOn: true,
      ),
      // Bathroom
      Device(
        id: 'bt_light_1',
        name: 'Bathroom Light',
        type: ApplianceType.light,
        roomId: '4',
        isOn: false,
        intensity: 90,
      ),
    ];
    notifyListeners();
  }

  List<Device> getDevicesByRoom(String roomId) {
    return _devices.where((device) => device.roomId == roomId).toList();
  }

  Future<void> toggleDevice(Device device) async {
    _error = null;
    notifyListeners();

    final newState = !device.isOn;
    final success = await _esp32Service.toggleDevice(device.id, newState);

    if (success) {
      final index = _devices.indexWhere((d) => d.id == device.id);
      if (index != -1) {
        _devices[index].isOn = newState;
        notifyListeners();
      }
    } else {
      _error = 'Failed to toggle ${device.name}';
      // Still update UI for demo purposes
      final index = _devices.indexWhere((d) => d.id == device.id);
      if (index != -1) {
        _devices[index].isOn = newState;
        notifyListeners();
      }
    }
  }

  Future<void> setDeviceIntensity(Device device, int intensity) async {
    _error = null;
    notifyListeners();

    final success = await _esp32Service.setDeviceIntensity(device.id, intensity);

    if (success) {
      final index = _devices.indexWhere((d) => d.id == device.id);
      if (index != -1) {
        _devices[index].intensity = intensity;
        notifyListeners();
      }
    } else {
      _error = 'Failed to set intensity for ${device.name}';
      // Still update UI for demo purposes
      final index = _devices.indexWhere((d) => d.id == device.id);
      if (index != -1) {
        _devices[index].intensity = intensity;
        notifyListeners();
      }
    }
  }

  Future<void> syncWithESP32() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final devices = await _esp32Service.getDevices();
    
    if (devices != null) {
      _devices = devices;
      _error = null;
    } else {
      _error = 'Failed to sync with ESP32';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> testESP32Connection() async {
    return await _esp32Service.testConnection();
  }

  void updateESP32Url(String url) {
    _esp32Service.updateBaseUrl(url);
    notifyListeners();
  }
}
