class BrowserParser {
  /// The browser name, set manually for a browser
  final String name;

  /// The browser type (e.g., 'browser', 'crawler', 'fetcher', 'cli', 'library')
  final String? type;

  /// The list of regexes that can possibly parse this browser
  final List<String> regexes;

  BrowserParser({
    required this.name,
    this.type,
    required this.regexes,
  });
}

/// Identifies the different browsers that can be parsed from a user agent string.
///
/// Each regex guarantees the following:
///    - A named group called 'unformattedName' identifies the browser name.
///    - A named group called 'version' identifies the browser version.
List<BrowserParser> browserParsers = [
  BrowserParser(
    name: 'Opera',
    regexes: [
      r'(?<unformattedName>opera\smini)\/(?<version>[\w\.-]+)', // Opera Mini
      r'(?<unformattedName>opera\s[mobiletab]{3,6}).+version\/(?<version>[\w\.-]+)', // Opera Mobile/Tablet
      r'(?<unformattedName>opera).+version\/(?<version>[\w\.]+)', // Opera > 9.80
      r'(?<unformattedName>opera)[\/\s]+(?<version>[\w\.]+)', //Opera < 9.80
      r'(?<unformattedName>opios)[\/\s]+(?<version>[\w\.]+)', // Opera Mini for iOS Webkit
      r'\s(?<unformattedName>opr)\/(?<version>[\w\.]+)', // Opera Webkit
    ],
  ),
  BrowserParser(
    name: "Konqueror",
    regexes: [
      r'(?<unformattedName>konqueror)\/(?<version>[\w\.]+)', // Konqueror
    ],
  ),
  BrowserParser(
    name: "IE",
    regexes: [
      r'(?<unformattedName>iemobile)(?:browser)?[\/\s]?(?<version>[\w\.]*)', // IEMobile
      r'(?:ms|\()(?<unformattedName>ie)\s(?<version>[\w\.]+)', // Internet Explorer
      r'(?<unformattedName>trident).+rv[:\s](?<version>[\w\.]{1,9}).+like\sgecko', // IE11
    ],
  ),
  BrowserParser(
    name: "Edge",
    regexes: [
      r'(?<unformattedName>edge|edgios|edga|edg)\/(?<version>(\d+)?[\w\.]+)', // Edge
    ],
  ),
  BrowserParser(
    name: 'Chrome',
    regexes: [
      r'(?<unformattedName>chrome)\/v?(?<version>[\w\.]+)', // Chrome
      r'(?<unformattedName>crmo|crios)\/(?<version>[\w\.]+)', // Chrome for iOS/iPad/Some Android
    ],
  ),
  BrowserParser(
    name: 'Safari',
    regexes: [
      r'version\/(?<version>[\w\.]+)\s.*(?<unformattedName>mobile\s?safari|safari)', // Safari & Safari Mobile
    ],
  ),
  BrowserParser(
    name: 'Netscape',
    regexes: [
      r'(?<unformattedName>navigator|netscape)\/(?<version>[\w\.-]+)', // Netscape
    ],
  ),
  BrowserParser(
    name: 'Firefox',
    regexes: [
      r'(?<unformattedName>fxios)\/(?<version>[\w\.-]+)', // Firefox for iOS
      r'(?<unformattedName>firefox)\/(?<version>[\w\.-]+)$', // Firefox
    ],
  ),
  // Bot/Crawler parsers
  BrowserParser(
    name: 'Googlebot',
    type: 'crawler',
    regexes: [
      r'(?<unformattedName>googlebot)\/(?<version>[\w\.]+)',
    ],
  ),
  BrowserParser(
    name: 'Bingbot',
    type: 'crawler',
    regexes: [
      r'(?<unformattedName>bingbot)\/(?<version>[\w\.]+)',
    ],
  ),
  BrowserParser(
    name: 'Slurp',
    type: 'crawler',
    regexes: [
      r'(?<unformattedName>slurp)',
    ],
  ),
  BrowserParser(
    name: 'DuckDuckBot',
    type: 'crawler',
    regexes: [
      r'(?<unformattedName>duckduckbot)\/(?<version>[\w\.]+)',
    ],
  ),
  BrowserParser(
    name: 'Baiduspider',
    type: 'crawler',
    regexes: [
      r'(?<unformattedName>baiduspider)\/(?<version>[\w\.]+)',
    ],
  ),
  BrowserParser(
    name: 'YandexBot',
    type: 'crawler',
    regexes: [
      r'(?<unformattedName>yandexbot)\/(?<version>[\w\.]+)',
    ],
  ),
  BrowserParser(
    name: 'Sogou Spider',
    type: 'crawler',
    regexes: [
      r'(?<unformattedName>sogou\sweb\spider)\/(?<version>[\w\.]+)',
    ],
  ),
  BrowserParser(
    name: 'Exabot',
    type: 'crawler',
    regexes: [
      r'(?<unformattedName>exabot)\/(?<version>[\w\.]+)',
    ],
  ),
  BrowserParser(
    name: 'facebookexternalhit',
    type: 'crawler',
    regexes: [
      r'(?<unformattedName>facebookexternalhit)\/(?<version>[\w\.]+)',
    ],
  ),
  BrowserParser(
    name: 'Twitterbot',
    type: 'crawler',
    regexes: [
      r'(?<unformattedName>twitterbot)\/(?<version>[\w\.]+)',
    ],
  ),
  BrowserParser(
    name: 'LinkedInBot',
    type: 'crawler',
    regexes: [
      r'(?<unformattedName>linkedinbot)\/(?<version>[\w\.]+)',
    ],
  ),
  BrowserParser(
    name: 'WhatsApp',
    type: 'fetcher',
    regexes: [
      r'(?<unformattedName>whatsapp)\/(?<version>[\w\.]+)',
    ],
  ),
  BrowserParser(
    name: 'curl',
    type: 'cli',
    regexes: [
      r'(?<unformattedName>curl)\/(?<version>[\w\.]+)',
    ],
  ),
  BrowserParser(
    name: 'wget',
    type: 'cli',
    regexes: [
      r'(?<unformattedName>wget)\/(?<version>[\w\.]+)',
    ],
  ),
  // Custom app parsers
  BrowserParser(
    name: 'Foodlz',
    type: 'mobile',
    regexes: [
      r'(?<unformattedName>foodlz)(?:\/(?<version>[\w\.]+))?',
    ],
  ),
];
