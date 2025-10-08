import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/data_service.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _urlController = TextEditingController();
  bool _isTestingConnection = false;
  String? _connectionStatus;
  bool _connectionSuccess = false;

  @override
  void initState() {
    super.initState();
    _loadSavedUrl();
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  Future<void> _loadSavedUrl() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUrl = prefs.getString('esp32_url') ?? 'http://192.168.4.1';
    _urlController.text = savedUrl;
  }

  Future<void> _testAndSaveConnection() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) {
      _showMessage('Please enter a valid URL', isError: true);
      return;
    }

    setState(() {
      _isTestingConnection = true;
      _connectionStatus = null;
      _connectionSuccess = false;
    });

    // Save URL
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('esp32_url', url);

    if (mounted) {
      final dataService = Provider.of<DataService>(context, listen: false);
      dataService.updateESP32Url(url);
      
      // Test connection
      final isConnected = await dataService.testESP32Connection();

      setState(() {
        _isTestingConnection = false;
        _connectionSuccess = isConnected;
        _connectionStatus = isConnected
            ? '✓ Connected successfully!'
            : '⚠ Connection failed. You can still continue and test later.';
      });
    }
  }

  Future<void> _continueToApp() async {
    final dataService = Provider.of<DataService>(context, listen: false);
    await dataService.completeSetup();

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  void _showMessage(String message, {bool isError = false}) {
    if (!mounted) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              // App Icon/Logo
              const Icon(
                Icons.home_outlined,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 24),
              // Welcome Text
              const Text(
                'Welcome to SereneSync',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Your Smart Home Automation Solution',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              // Connection Card
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.wifi, color: Colors.blue, size: 28),
                          SizedBox(width: 12),
                          Text(
                            'Connect to ESP32',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Enter your ESP32 module\'s IP address to get started. You can change this later in settings.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _urlController,
                        decoration: const InputDecoration(
                          labelText: 'ESP32 URL',
                          hintText: 'http://192.168.4.1',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.link),
                        ),
                        keyboardType: TextInputType.url,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _isTestingConnection ? null : _testAndSaveConnection,
                          icon: _isTestingConnection
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : const Icon(Icons.wifi_find),
                          label: Text(_isTestingConnection ? 'Testing...' : 'Test Connection'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                      if (_connectionStatus != null) ...[
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: _connectionSuccess
                                ? Colors.green.shade100
                                : Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                _connectionSuccess
                                    ? Icons.check_circle
                                    : Icons.info_outline,
                                color: _connectionSuccess
                                    ? Colors.green.shade700
                                    : Colors.orange.shade700,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  _connectionStatus!,
                                  style: TextStyle(
                                    color: _connectionSuccess
                                        ? Colors.green.shade700
                                        : Colors.orange.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Features List
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'What\'s Next?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildFeatureItem(
                        icon: Icons.home_work,
                        title: 'Create Rooms',
                        description: 'Add custom rooms with your own names and icons',
                      ),
                      const SizedBox(height: 12),
                      _buildFeatureItem(
                        icon: Icons.devices,
                        title: 'Add Devices',
                        description: 'Add lights, fans, and sockets to each room',
                      ),
                      const SizedBox(height: 12),
                      _buildFeatureItem(
                        icon: Icons.control_camera,
                        title: 'Control Everything',
                        description: 'Manage all your devices from one place',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _connectionStatus != null ? _continueToApp : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Continue to App',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Note: You can skip ESP32 connection and set it up later in settings.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
