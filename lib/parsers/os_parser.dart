class OSParser {
  /// The OS name, set manually for an OS
  final String name;

  /// The list of regexes that can possibly parse this OS
  final List<String> regexes;

  OSParser({
    required this.name,
    required this.regexes,
  });
}

/// Identifies the different operating systems that can be parsed from a user agent string.
///
/// Each regex guarantees the following:
///    - A named group called 'unformattedName' identifies the OS name.
///    - A named group called 'version' identifies the OS version.
List<OSParser> osParsers = [
  OSParser(
    name: 'iOS',
    regexes: [
      r'cpu iphone os ([\d_.]+) like mac os x',
      r'cpu os ([\d_.]+) like mac os x',
    ],
  ),
  OSParser(
    name: 'Windows',
    regexes: [
      r'windows nt ([\d.]+)',
      r'windows nt',
    ],
  ),
  OSParser(
    name: 'macOS',
    regexes: [
      r'mac os x ([\d_.]+)',
      r'mac os x',
    ],
  ),
  OSParser(
    name: 'Android',
    regexes: [
      r'android ([\d.]+)',
      r'android',
    ],
  ),
  OSParser(
    name: 'Chrome OS',
    regexes: [
      r'cros',
    ],
  ),
];
