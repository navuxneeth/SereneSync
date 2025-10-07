import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/device.dart';

class ESP32Service {
  String _baseUrl = 'http://192.168.4.1'; // Default ESP32 AP IP

  String get baseUrl => _baseUrl;

  void updateBaseUrl(String url) {
    _baseUrl = url.replaceAll(RegExp(r'/$'), ''); // Remove trailing slash
  }

  // Toggle device on/off
  Future<bool> toggleDevice(String deviceId, bool state) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/device/$deviceId/toggle'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'state': state}),
      ).timeout(const Duration(seconds: 5));

      return response.statusCode == 200;
    } catch (e) {
      print('Error toggling device: $e');
      return false;
    }
  }

  // Set device intensity (for dimmable lights/fan speed)
  Future<bool> setDeviceIntensity(String deviceId, int intensity) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/device/$deviceId/intensity'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'intensity': intensity}),
      ).timeout(const Duration(seconds: 5));

      return response.statusCode == 200;
    } catch (e) {
      print('Error setting device intensity: $e');
      return false;
    }
  }

  // Get all devices status
  Future<List<Device>?> getDevices() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/api/devices'),
      ).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Device.fromJson(json)).toList();
      }
      return null;
    } catch (e) {
      print('Error getting devices: $e');
      return null;
    }
  }

  // Test connection to ESP32
  Future<bool> testConnection() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/api/status'),
      ).timeout(const Duration(seconds: 3));

      return response.statusCode == 200;
    } catch (e) {
      print('Error testing connection: $e');
      return false;
    }
  }
}
