import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/data_service.dart';
import '../models/device.dart';
import '../models/appliance_type.dart';

class ManageDevicesScreen extends StatelessWidget {
  const ManageDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Devices',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Consumer<DataService>(
        builder: (context, dataService, child) {
          final devices = dataService.devices;
          final rooms = dataService.rooms;

          if (rooms.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_work_outlined,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No rooms available',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Please create a room first before adding devices',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          if (devices.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.devices_outlined,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No devices yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap the + button to add your first device',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: devices.length,
            itemBuilder: (context, index) {
              final device = devices[index];
              final room = rooms.firstWhere(
                (r) => r.id == device.roomId,
                orElse: () => rooms.first,
              );

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    child: Text(
                      device.type.icon,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  title: Text(
                    device.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${room.name} • ${device.type.displayName}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _showEditDeviceDialog(context, device),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () => _confirmDelete(context, device),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddDeviceDialog(context),
        icon: const Icon(Icons.add),
        label: const Text('Add Device'),
      ),
    );
  }

  void _showAddDeviceDialog(BuildContext context) {
    final nameController = TextEditingController();
    final idController = TextEditingController();
    ApplianceType selectedType = ApplianceType.light;
    String? selectedRoomId;

    final dataService = Provider.of<DataService>(context, listen: false);
    final rooms = dataService.rooms;

    if (rooms.isNotEmpty) {
      selectedRoomId = rooms.first.id;
    }

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Add New Device'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Device Name',
                    hintText: 'e.g., Ceiling Light',
                    border: OutlineInputBorder(),
                  ),
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(
                    labelText: 'Device ID',
                    hintText: 'e.g., device_001',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedRoomId,
                  decoration: const InputDecoration(
                    labelText: 'Room',
                    border: OutlineInputBorder(),
                  ),
                  items: rooms.map((room) {
                    return DropdownMenuItem(
                      value: room.id,
                      child: Text('${room.icon} ${room.name}'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRoomId = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Device Type:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...ApplianceType.values.map((type) {
                  return RadioListTile<ApplianceType>(
                    title: Text('${type.icon} ${type.displayName}'),
                    value: type,
                    groupValue: selectedType,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  );
                }),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a device name')),
                  );
                  return;
                }
                if (idController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a device ID')),
                  );
                  return;
                }
                if (selectedRoomId == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a room')),
                  );
                  return;
                }

                final newDevice = Device(
                  id: idController.text.trim(),
                  name: nameController.text.trim(),
                  type: selectedType,
                  roomId: selectedRoomId!,
                  isOn: false,
                  intensity: selectedType != ApplianceType.socket ? 50 : null,
                );
                dataService.addDevice(newDevice);
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDeviceDialog(BuildContext context, Device device) {
    final nameController = TextEditingController(text: device.name);
    ApplianceType selectedType = device.type;
    String selectedRoomId = device.roomId;

    final dataService = Provider.of<DataService>(context, listen: false);
    final rooms = dataService.rooms;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Edit Device'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Device Name',
                    border: OutlineInputBorder(),
                  ),
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: TextEditingController(text: device.id),
                  decoration: const InputDecoration(
                    labelText: 'Device ID',
                    border: OutlineInputBorder(),
                  ),
                  enabled: false,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedRoomId,
                  decoration: const InputDecoration(
                    labelText: 'Room',
                    border: OutlineInputBorder(),
                  ),
                  items: rooms.map((room) {
                    return DropdownMenuItem(
                      value: room.id,
                      child: Text('${room.icon} ${room.name}'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRoomId = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Device Type:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...ApplianceType.values.map((type) {
                  return RadioListTile<ApplianceType>(
                    title: Text('${type.icon} ${type.displayName}'),
                    value: type,
                    groupValue: selectedType,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  );
                }),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a device name')),
                  );
                  return;
                }

                final updatedDevice = device.copyWith(
                  name: nameController.text.trim(),
                  type: selectedType,
                  roomId: selectedRoomId,
                  intensity: selectedType != ApplianceType.socket
                      ? (device.intensity ?? 50)
                      : null,
                );
                dataService.updateDevice(updatedDevice);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, Device device) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Device'),
        content: Text('Are you sure you want to delete "${device.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final dataService = Provider.of<DataService>(context, listen: false);
              dataService.deleteDevice(device.id);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
