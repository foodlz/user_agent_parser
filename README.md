# user_agent_parser

A Flutter-based User-Agent string parser. This package aims to identify the type of web browser, engine, operating system, device, and CPU entirely from a User-Agent string.

**Requires Dart 3.0+**

Inspired by [ua-parser-js](https://www.npmjs.com/package/ua-parser-js)

## Usage
Import the package.
```dart
import 'package:user_agent_parser/user_agent_parser.dart';
```

Create a `UserAgentParser` and parse comprehensive information.
```dart
UserAgentParser parser = UserAgentParser();
String userAgent1 = 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1';
Result result = parser.parseResult(userAgent1);

print('Browser: ${result.browser?.name}'); // Chrome (or null if no browser detected)
print('Engine: ${result.engine?.name}'); // WebKit
print('OS: ${result.os?.name}'); // iOS
print('Device: ${result.device?.model}'); // iPhone
print('CPU: ${result.cpu?.architecture}'); // ARM
```

## Individual Parsers

You can also use individual parsers for specific components:

```dart
Browser? browser = parser.parseBrowser(userAgent);
Engine? engine = parser.parseEngine(userAgent);
OS? os = parser.parseOS(userAgent);
Device? device = parser.parseDevice(userAgent);
CPU? cpu = parser.parseCPU(userAgent);
```
