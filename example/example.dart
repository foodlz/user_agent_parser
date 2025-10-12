import 'package:user_agent_parser_plus/user_agent_parser_plus.dart';

void main() {
  UserAgentParser parser = UserAgentParser();

  String userAgent1 =
      'Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1';
  Result result = parser.parseResult(userAgent1);

  print(
      'Browser: ${result.browser?.name}'); // Chrome (or null if no browser detected)
  print('Engine: ${result.engine?.name}'); // WebKit
  print('OS: ${result.os?.name}'); // iOS
  print('Device: ${result.device?.model}'); // iPhone
  print('CPU: ${result.cpu?.architecture}'); // ARM

  // Test bot detection
  String botUserAgent =
      'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)';
  Result botResult = parser.parseResult(botUserAgent);

  print('Bot Browser: ${botResult.browser?.name}'); // Googlebot
  print('Bot Type: ${botResult.browser?.type}'); // crawler

  // Test helper functions
  print('Is Bot: ${isBot(botResult.browser)}'); // true
  print('Is Desktop: ${isDesktop(result.browser)}'); // true (for Chrome)

  // Test custom Foodlz app
  String foodlzUserAgent = 'Foodlz';
  Result foodlzResult = parser.parseResult(foodlzUserAgent);

  print('Foodlz Browser: ${foodlzResult.browser?.name}'); // Foodlz
  print('Foodlz Type: ${foodlzResult.browser?.type}'); // mobile
  print(
      'Foodlz Version: "${foodlzResult.browser?.version}"'); // (empty string if no version)

  // Test Foodlz with version
  String foodlzVersionedUserAgent = 'Foodlz/1.2.3';
  Result foodlzVersionedResult = parser.parseResult(foodlzVersionedUserAgent);

  print(
      'Foodlz Versioned Browser: ${foodlzVersionedResult.browser?.name}'); // Foodlz
  print(
      'Foodlz Versioned Type: ${foodlzVersionedResult.browser?.type}'); // mobile
  print(
      'Foodlz Versioned Version: "${foodlzVersionedResult.browser?.version}"'); // 1.2.3
}
