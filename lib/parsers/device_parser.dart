class DeviceParser {
  /// The device type
  final String type;

  /// The device vendor
  final String vendor;

  /// The device model
  final String model;

  /// The list of regexes that can possibly parse this device
  final List<String> regexes;

  DeviceParser({
    required this.type,
    required this.vendor,
    required this.model,
    required this.regexes,
  });
}

/// Identifies the different devices that can be parsed from a user agent string.
///
/// Each regex guarantees the following:
///    - A named group called 'model' identifies the device model.
List<DeviceParser> deviceParsers = [
  DeviceParser(
    type: 'mobile',
    vendor: 'Apple',
    model: 'iPhone',
    regexes: [
      r'iphone',
    ],
  ),
  DeviceParser(
    type: 'tablet',
    vendor: 'Apple',
    model: 'iPad',
    regexes: [
      r'ipad',
    ],
  ),
  DeviceParser(
    type: 'mobile',
    vendor: 'Apple',
    model: 'iPod',
    regexes: [
      r'ipod',
    ],
  ),
  DeviceParser(
    type: 'desktop',
    vendor: 'Generic',
    model: 'Desktop',
    regexes: [
      r'windows nt',
      r'mac os x',
      r'linux',
    ],
  ),
  DeviceParser(
    type: 'mobile',
    vendor: 'Generic',
    model: 'Mobile',
    regexes: [
      r'android.*mobile',
      r'mobile',
    ],
  ),
  DeviceParser(
    type: 'tablet',
    vendor: 'Generic',
    model: 'Tablet',
    regexes: [
      r'android',
      r'tablet',
    ],
  ),
];
