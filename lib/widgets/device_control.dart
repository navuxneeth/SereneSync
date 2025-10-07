import 'package:flutter/material.dart';
import '../models/device.dart';
import '../models/appliance_type.dart';

class DeviceControl extends StatelessWidget {
  final Device device;
  final Function(bool) onToggle;
  final Function(int)? onIntensityChange;

  const DeviceControl({
    super.key,
    required this.device,
    required this.onToggle,
    this.onIntensityChange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      device.type.icon,
                      style: const TextStyle(fontSize: 32),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          device.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          device.type.displayName,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Switch(
                  value: device.isOn,
                  onChanged: onToggle,
                  activeThumbColor: Colors.blue,
                ),
              ],
            ),
            if (device.intensity != null && device.isOn) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    device.type == ApplianceType.fan
                        ? Icons.speed
                        : Icons.brightness_6,
                    size: 20,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Slider(
                      value: device.intensity!.toDouble(),
                      min: 0,
                      max: 100,
                      divisions: 10,
                      label: '${device.intensity}%',
                      onChanged: onIntensityChange != null
                          ? (value) => onIntensityChange!(value.toInt())
                          : null,
                    ),
                  ),
                  Text(
                    '${device.intensity}%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
