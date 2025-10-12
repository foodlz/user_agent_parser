class Engine {
  /// The engine name, set manually for an engine
  final String name;

  /// The engine name, parsed directly from the user agent string without modification
  final String unformattedName;

  /// The engine version
  final String version;

  /// The regex that was used to parse this engine
  final String parsedWithRegex;

  Engine({
    required this.name,
    required this.unformattedName,
    required this.version,
    required this.parsedWithRegex,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Engine &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          unformattedName == other.unformattedName &&
          version == other.version &&
          parsedWithRegex == other.parsedWithRegex;

  @override
  int get hashCode => name.hashCode ^ version.hashCode;
}
