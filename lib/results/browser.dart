/// Represents a parsed browser from a user agent string.
///
/// Contains information about the browser including its name, version,
/// type (browser, crawler, etc.), and the regex pattern used for parsing.
class Browser {
  /// The browser name, set manually for a browser
  final String name;

  /// The browser name, parsed directly from the user agent string without modification
  final String unformattedName;

  /// The browser version
  final String version;

  /// The browser type (e.g., 'browser', 'crawler', 'fetcher', 'cli', 'library')
  final String? type;

  /// The regex that was used to parse this browser
  final String parsedWithRegex;

  Browser({
    required this.name,
    required this.unformattedName,
    required this.version,
    this.type,
    required this.parsedWithRegex,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Browser &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          unformattedName == other.unformattedName &&
          version == other.version &&
          type == other.type &&
          parsedWithRegex == other.parsedWithRegex;

  @override
  int get hashCode => name.hashCode ^ version.hashCode ^ type.hashCode;
}
