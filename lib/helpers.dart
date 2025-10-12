/// Helper functions for user agent parsing
library helpers;

import 'package:user_agent_parser_plus/results/browser.dart';
import 'package:user_agent_parser_plus/results/device.dart';

/// Check if a browser is a bot/crawler
bool isBot(Browser? browser) {
  if (browser == null) return false;
  return browser.type == 'crawler' ||
      browser.type == 'fetcher' ||
      browser.type == 'cli' ||
      browser.type == 'library';
}

/// Check if a browser is a mobile browser
bool isMobile(Browser? browser) {
  if (browser == null) return false;
  // This would need to be implemented based on user agent analysis
  // For now, return false
  return false;
}

/// Check if a browser is a desktop browser
bool isDesktop(Browser? browser) {
  if (browser == null) return false;
  return !isBot(browser) && !isMobile(browser);
}

/// Check if a device is mobile
bool isMobileDevice(Device? device) {
  if (device == null) return false;
  return device.type == 'mobile' ||
      device.type == 'tablet' ||
      device.type == 'wearable';
}

/// Check if a device is desktop
bool isDesktopDevice(Device? device) {
  if (device == null) return false;
  return device.type == 'desktop';
}
