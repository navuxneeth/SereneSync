import 'package:flutter_test/flutter_test.dart';
import 'package:serenesync/main.dart';
import 'package:serenesync/models/device.dart';
import 'package:serenesync/models/room.dart';
import 'package:serenesync/models/appliance_type.dart';

void main() {
  group('Model Tests', () {
    test('Device model serialization', () {
      final device = Device(
        id: 'test_1',
        name: 'Test Light',
        type: ApplianceType.light,
        roomId: '1',
        isOn: true,
        intensity: 80,
      );

      final json = device.toJson();
      expect(json['id'], 'test_1');
      expect(json['name'], 'Test Light');
      expect(json['type'], 'light');
      expect(json['isOn'], true);
      expect(json['intensity'], 80);
    });

    test('Device model deserialization', () {
      final json = {
        'id': 'test_1',
        'name': 'Test Light',
        'type': 'light',
        'roomId': '1',
        'isOn': true,
        'intensity': 80,
      };

      final device = Device.fromJson(json);
      expect(device.id, 'test_1');
      expect(device.name, 'Test Light');
      expect(device.type, ApplianceType.light);
      expect(device.isOn, true);
      expect(device.intensity, 80);
    });

    test('Room model serialization', () {
      final room = Room(
        id: '1',
        name: 'Living Room',
        icon: '🛋️',
      );

      final json = room.toJson();
      expect(json['id'], '1');
      expect(json['name'], 'Living Room');
      expect(json['icon'], '🛋️');
    });

    test('ApplianceType extension', () {
      expect(ApplianceType.light.displayName, 'Light');
      expect(ApplianceType.fan.displayName, 'Fan');
      expect(ApplianceType.socket.displayName, 'Socket');
      
      expect(ApplianceType.light.icon, '💡');
      expect(ApplianceType.fan.icon, '🌀');
      expect(ApplianceType.socket.icon, '🔌');
    });
  });

  group('Widget Tests', () {
    testWidgets('App initializes correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const SereneSync());
      expect(find.text('SereneSync'), findsOneWidget);
    });
  });
}
