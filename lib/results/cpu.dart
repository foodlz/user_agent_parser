class CPU {
  /// The CPU architecture
  final String architecture;

  /// The regex that was used to parse this CPU
  final String parsedWithRegex;

  CPU({
    required this.architecture,
    required this.parsedWithRegex,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CPU &&
          runtimeType == other.runtimeType &&
          architecture == other.architecture &&
          parsedWithRegex == other.parsedWithRegex;

  @override
  int get hashCode => architecture.hashCode;
}
