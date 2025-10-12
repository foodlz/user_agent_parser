class EngineParser {
  /// The engine name, set manually for an engine
  final String name;

  /// The list of regexes that can possibly parse this engine
  final List<String> regexes;

  EngineParser({
    required this.name,
    required this.regexes,
  });
}

/// Identifies the different engines that can be parsed from a user agent string.
///
/// Each regex guarantees the following:
///    - A named group called 'unformattedName' identifies the engine name.
///    - A named group called 'version' identifies the engine version.
List<EngineParser> engineParsers = [
  EngineParser(
    name: 'WebKit',
    regexes: [
      r'(?<unformattedName>webkit)\/(?<version>[\d.]+)',
    ],
  ),
  EngineParser(
    name: 'Blink',
    regexes: [
      r'(?<unformattedName>blink)',
    ],
  ),
  EngineParser(
    name: 'Gecko',
    regexes: [
      r'(?<unformattedName>gecko)\/(?<version>[\d.]+)',
    ],
  ),
  EngineParser(
    name: 'Trident',
    regexes: [
      r'(?<unformattedName>trident)\/(?<version>[\d.]+)',
    ],
  ),
  EngineParser(
    name: 'EdgeHTML',
    regexes: [
      r'(?<unformattedName>edge)\/(?<version>[\d.]+)',
    ],
  ),
];
