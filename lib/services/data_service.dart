import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/room.dart';
import '../models/device.dart';
import 'esp32_service.dart';

class DataService extends ChangeNotifier {
  final ESP32Service _esp32Service = ESP32Service();
  
  List<Room> _rooms = [];
  List<Device> _devices = [];
  bool _isLoading = false;
  String? _error;
  bool _isSetupComplete = false;

  List<Room> get rooms => _rooms;
  List<Device> get devices => _devices;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isSetupComplete => _isSetupComplete;
  ESP32Service get esp32Service => _esp32Service;

  DataService() {
    _loadData();
  }

  // Load data from SharedPreferences
  Future<void> _loadData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _isSetupComplete = prefs.getBool('setup_complete') ?? false;
      
      final roomsJson = prefs.getString('rooms');
      if (roomsJson != null) {
        final List<dynamic> roomsList = json.decode(roomsJson);
        _rooms = roomsList.map((json) => Room.fromJson(json)).toList();
      }
      
      final devicesJson = prefs.getString('devices');
      if (devicesJson != null) {
        final List<dynamic> devicesList = json.decode(devicesJson);
        _devices = devicesList.map((json) => Device.fromJson(json)).toList();
      }
      
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading data: $e');
    }
  }

  // Save data to SharedPreferences
  Future<void> _saveData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('rooms', json.encode(_rooms.map((r) => r.toJson()).toList()));
      await prefs.setString('devices', json.encode(_devices.map((d) => d.toJson()).toList()));
      await prefs.setBool('setup_complete', _isSetupComplete);
    } catch (e) {
      debugPrint('Error saving data: $e');
    }
  }

  // Mark setup as complete
  Future<void> completeSetup() async {
    _isSetupComplete = true;
    await _saveData();
    notifyListeners();
  }

  // Add a new room
  Future<void> addRoom(Room room) async {
    _rooms.add(room);
    await _saveData();
    notifyListeners();
  }

  // Update a room
  Future<void> updateRoom(Room room) async {
    final index = _rooms.indexWhere((r) => r.id == room.id);
    if (index != -1) {
      _rooms[index] = room;
      await _saveData();
      notifyListeners();
    }
  }

  // Delete a room and its devices
  Future<void> deleteRoom(String roomId) async {
    _rooms.removeWhere((r) => r.id == roomId);
    _devices.removeWhere((d) => d.roomId == roomId);
    await _saveData();
    notifyListeners();
  }

  // Add a new device
  Future<void> addDevice(Device device) async {
    _devices.add(device);
    await _saveData();
    notifyListeners();
  }

  // Update a device
  Future<void> updateDevice(Device device) async {
    final index = _devices.indexWhere((d) => d.id == device.id);
    if (index != -1) {
      _devices[index] = device;
      await _saveData();
      notifyListeners();
    }
  }

  // Delete a device
  Future<void> deleteDevice(String deviceId) async {
    _devices.removeWhere((d) => d.id == deviceId);
    await _saveData();
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
        await _saveData();
        notifyListeners();
      }
    } else {
      _error = 'Failed to toggle ${device.name}';
      // Still update UI for demo purposes
      final index = _devices.indexWhere((d) => d.id == device.id);
      if (index != -1) {
        _devices[index].isOn = newState;
        await _saveData();
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
        await _saveData();
        notifyListeners();
      }
    } else {
      _error = 'Failed to set intensity for ${device.name}';
      // Still update UI for demo purposes
      final index = _devices.indexWhere((d) => d.id == device.id);
      if (index != -1) {
        _devices[index].intensity = intensity;
        await _saveData();
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
      await _saveData();
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
