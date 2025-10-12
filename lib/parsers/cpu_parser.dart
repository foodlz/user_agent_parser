class CPUParser {
  /// The CPU architecture
  final String architecture;

  /// The list of regexes that can possibly parse this CPU
  final List<String> regexes;

  CPUParser({
    required this.architecture,
    required this.regexes,
  });
}

/// Identifies the different CPU architectures that can be parsed from a user agent string.
List<CPUParser> cpuParsers = [
  CPUParser(
    architecture: 'x64',
    regexes: [
      r'x64',
      r'x86_64',
      r'amd64',
      r'intel64',
    ],
  ),
  CPUParser(
    architecture: 'x86',
    regexes: [
      r'x86',
      r'i386',
      r'i486',
      r'i586',
      r'i686',
    ],
  ),
  CPUParser(
    architecture: 'ARM',
    regexes: [
      r'arm',
      r'iphone', // iPhone typically uses ARM
      r'ipad', // iPad typically uses ARM
      r'ipod', // iPod typically uses ARM
    ],
  ),
  CPUParser(
    architecture: 'ARM64',
    regexes: [
      r'arm64',
      r'aarch64',
    ],
  ),
];
