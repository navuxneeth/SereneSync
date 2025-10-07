# ESP32 API Specification

This document describes the REST API endpoints that the ESP32 module should implement to work with the SereneSync Flutter app.

## Base URL

Default: `http://192.168.4.1`

The base URL can be configured in the app's settings.

## Authentication

Currently, no authentication is required. Future versions may implement token-based authentication for security.

## Endpoints

### 1. Get All Devices

Retrieve the status of all registered devices.

**Endpoint:** `GET /api/devices`

**Response:**
```json
[
  {
    "id": "lr_light_1",
    "name": "Ceiling Light",
    "type": "light",
    "roomId": "1",
    "isOn": true,
    "intensity": 80
  },
  {
    "id": "lr_fan_1",
    "name": "Ceiling Fan",
    "type": "fan",
    "roomId": "1",
    "isOn": false,
    "intensity": 60
  },
  {
    "id": "lr_socket_1",
    "name": "TV Socket",
    "type": "socket",
    "roomId": "1",
    "isOn": true
  }
]
```

**Status Codes:**
- `200 OK`: Success
- `500 Internal Server Error`: Server error

### 2. Toggle Device

Turn a device on or off.

**Endpoint:** `POST /api/device/{deviceId}/toggle`

**Path Parameters:**
- `deviceId` (string): Unique identifier of the device

**Request Body:**
```json
{
  "state": true
}
```

**Parameters:**
- `state` (boolean): `true` to turn on, `false` to turn off

**Response:**
```json
{
  "success": true,
  "deviceId": "lr_light_1",
  "state": true
}
```

**Status Codes:**
- `200 OK`: Device toggled successfully
- `404 Not Found`: Device not found
- `400 Bad Request`: Invalid request body
- `500 Internal Server Error`: Server error

### 3. Set Device Intensity

Set the intensity/brightness level for a device (for lights and fans).

**Endpoint:** `POST /api/device/{deviceId}/intensity`

**Path Parameters:**
- `deviceId` (string): Unique identifier of the device

**Request Body:**
```json
{
  "intensity": 75
}
```

**Parameters:**
- `intensity` (integer): Value between 0-100 representing the intensity level

**Response:**
```json
{
  "success": true,
  "deviceId": "lr_light_1",
  "intensity": 75
}
```

**Status Codes:**
- `200 OK`: Intensity set successfully
- `404 Not Found`: Device not found
- `400 Bad Request`: Invalid intensity value or device doesn't support intensity control
- `500 Internal Server Error`: Server error

### 4. Health Check

Check if the ESP32 is online and responding.

**Endpoint:** `GET /api/status`

**Response:**
```json
{
  "status": "online",
  "version": "1.0.0",
  "uptime": 3600
}
```

**Parameters:**
- `status` (string): Current status ("online" or "offline")
- `version` (string): Firmware version
- `uptime` (integer): Uptime in seconds

**Status Codes:**
- `200 OK`: ESP32 is online
- `503 Service Unavailable`: ESP32 is not ready

## Data Types

### Device Types

The `type` field can have one of the following values:
- `"light"`: Light/bulb
- `"fan"`: Fan
- `"socket"`: Power socket/outlet

### Device Object

```typescript
{
  id: string;          // Unique device identifier
  name: string;        // Human-readable device name
  type: "light" | "fan" | "socket";  // Device type
  roomId: string;      // ID of the room the device belongs to
  isOn: boolean;       // Current power state
  intensity?: number;  // Optional: 0-100 for dimmable lights/fan speed
}
```

## Error Responses

All error responses follow this format:

```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable error message"
  }
}
```

**Common Error Codes:**
- `DEVICE_NOT_FOUND`: The specified device ID doesn't exist
- `INVALID_REQUEST`: The request body is malformed
- `INVALID_INTENSITY`: Intensity value is out of range (0-100)
- `DEVICE_UNREACHABLE`: Cannot communicate with the physical device
- `INTERNAL_ERROR`: Unexpected server error

## Example ESP32 Implementation (Arduino)

```cpp
#include <WiFi.h>
#include <WebServer.h>
#include <ArduinoJson.h>

WebServer server(80);

void setup() {
  // WiFi setup
  WiFi.softAP("ESP32-SereneSync", "password123");
  
  // Route handlers
  server.on("/api/devices", HTTP_GET, handleGetDevices);
  server.on("/api/device/*/toggle", HTTP_POST, handleToggleDevice);
  server.on("/api/device/*/intensity", HTTP_POST, handleSetIntensity);
  server.on("/api/status", HTTP_GET, handleStatus);
  
  server.begin();
}

void loop() {
  server.handleClient();
}

void handleGetDevices() {
  StaticJsonDocument<2048> doc;
  JsonArray devices = doc.to<JsonArray>();
  
  // Add your devices here
  JsonObject device1 = devices.createNestedObject();
  device1["id"] = "lr_light_1";
  device1["name"] = "Ceiling Light";
  device1["type"] = "light";
  device1["roomId"] = "1";
  device1["isOn"] = digitalRead(LIGHT_PIN);
  device1["intensity"] = 80;
  
  String response;
  serializeJson(doc, response);
  server.send(200, "application/json", response);
}

void handleToggleDevice() {
  // Parse device ID from URL
  String path = server.uri();
  String deviceId = extractDeviceId(path);
  
  // Parse request body
  StaticJsonDocument<200> doc;
  deserializeJson(doc, server.arg("plain"));
  bool state = doc["state"];
  
  // Control the device
  controlDevice(deviceId, state);
  
  // Send response
  server.send(200, "application/json", "{\"success\":true}");
}

void handleStatus() {
  StaticJsonDocument<200> doc;
  doc["status"] = "online";
  doc["version"] = "1.0.0";
  doc["uptime"] = millis() / 1000;
  
  String response;
  serializeJson(doc, response);
  server.send(200, "application/json", response);
}
```

## Rate Limiting

Currently, no rate limiting is enforced. However, it's recommended to:
- Limit requests to 10 per second per client
- Implement exponential backoff on the client side for failed requests

## WebSocket Support (Future)

Future versions may include WebSocket support for real-time bidirectional communication:

**Endpoint:** `ws://192.168.4.1/ws`

**Events:**
- `device_state_changed`: Notifies clients when a device state changes
- `device_added`: New device registered
- `device_removed`: Device unregistered

## Notes

- All requests should include `Content-Type: application/json` header
- Responses are always in JSON format
- The ESP32 should respond within 5 seconds (app timeout)
- Device IDs should be unique and URL-safe strings
- Room IDs should match those configured in the app