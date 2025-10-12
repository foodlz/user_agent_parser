# user_agent_parser_plus

An enhanced Flutter-based User-Agent string parser with comprehensive bot detection and custom app support. This package aims to identify web browsers, engines, operating systems, devices, CPUs, and bots entirely from a User-Agent string.

**Requires Dart 3.0+**

## About

This package is an enhanced fork of the original [user_agent_parser](https://pub.dev/packages/user_agent_parser) package, with the following improvements:

- ✅ **Comprehensive bot detection** - Recognizes major search engine crawlers, social media bots, and automated tools
- ✅ **Helper functions** - Easy-to-use functions like `isBot()`, `isMobile()`, `isDesktop()`
- ✅ **Custom app support** - Built-in parser for Flutter mobile apps (like "Foodlz")
- ✅ **Enhanced browser detection** - Support for 15+ additional browsers and variants
- ✅ **Null safety** - Fully migrated to Dart's null safety features

Inspired by [ua-parser-js](https://www.npmjs.com/package/ua-parser-js)

## Usage
Import the package.
```dart
import 'package:user_agent_parser_plus/user_agent_parser_plus.dart';
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

## Attribution

This package is a fork and enhancement of the original [user_agent_parser](https://pub.dev/packages/user_agent_parser) package. All credit for the original implementation goes to the original author.

## License

This project is licensed under the same MIT License as the original package.
