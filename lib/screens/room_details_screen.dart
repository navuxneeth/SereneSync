import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/room.dart';
import '../services/data_service.dart';
import '../widgets/device_control.dart';

class RoomDetailsScreen extends StatelessWidget {
  final Room room;

  const RoomDetailsScreen({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          room.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Consumer<DataService>(
        builder: (context, dataService, child) {
          final devices = dataService.getDevicesByRoom(room.id);
          final activeDevices = devices.where((d) => d.isOn).length;

          return Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      room.icon,
                      style: const TextStyle(fontSize: 64),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '$activeDevices of ${devices.length} devices active',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    if (devices.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          _toggleAllDevices(context, dataService, devices);
                        },
                        icon: Icon(
                          activeDevices > 0 ? Icons.power_off : Icons.power,
                        ),
                        label: Text(
                          activeDevices > 0 ? 'Turn All Off' : 'Turn All On',
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Expanded(
                child: devices.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.device_hub_outlined,
                              size: 64,
                              color: Colors.grey.shade400,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No devices in this room',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: devices.length,
                        itemBuilder: (context, index) {
                          final device = devices[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: DeviceControl(
                              device: device,
                              onToggle: (value) {
                                dataService.toggleDevice(device);
                              },
                              onIntensityChange: device.intensity != null
                                  ? (value) {
                                      dataService.setDeviceIntensity(
                                        device,
                                        value,
                                      );
                                    }
                                  : null,
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _toggleAllDevices(
    BuildContext context,
    DataService dataService,
    List devices,
  ) {
    final activeCount = devices.where((d) => d.isOn).length;
    final targetState = activeCount == 0;

    for (var device in devices) {
      if (device.isOn != targetState) {
        dataService.toggleDevice(device);
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          targetState
              ? 'Turning on all devices...'
              : 'Turning off all devices...',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
