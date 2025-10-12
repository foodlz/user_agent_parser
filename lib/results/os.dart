class OS {
  /// The OS name, set manually for an OS
  final String name;

  /// The OS name, parsed directly from the user agent string without modification
  final String unformattedName;

  /// The OS version
  final String version;

  /// The regex that was used to parse this OS
  final String parsedWithRegex;

  OS({
    required this.name,
    required this.unformattedName,
    required this.version,
    required this.parsedWithRegex,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OS &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          unformattedName == other.unformattedName &&
          version == other.version &&
          parsedWithRegex == other.parsedWithRegex;

  @override
  int get hashCode => name.hashCode ^ version.hashCode;
}
