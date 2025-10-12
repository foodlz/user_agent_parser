library user_agent_parser;

import 'package:user_agent_parser_plus/parsers/browser_parser.dart';
import 'package:user_agent_parser_plus/parsers/engine_parser.dart';
import 'package:user_agent_parser_plus/parsers/os_parser.dart';
import 'package:user_agent_parser_plus/parsers/device_parser.dart';
import 'package:user_agent_parser_plus/parsers/cpu_parser.dart';
import 'package:user_agent_parser_plus/results/browser.dart';
import 'package:user_agent_parser_plus/results/engine.dart';
import 'package:user_agent_parser_plus/results/os.dart';
import 'package:user_agent_parser_plus/results/device.dart';
import 'package:user_agent_parser_plus/results/cpu.dart';
import 'package:user_agent_parser_plus/results/result.dart';

export 'package:user_agent_parser_plus/results/browser.dart';
export 'package:user_agent_parser_plus/results/engine.dart';
export 'package:user_agent_parser_plus/results/os.dart';
export 'package:user_agent_parser_plus/results/device.dart';
export 'package:user_agent_parser_plus/results/cpu.dart';
export 'package:user_agent_parser_plus/results/result.dart';
export 'package:user_agent_parser_plus/helpers.dart';

class UserAgentParser {
  /// Parse a [Result] from the [userAgent] string.
  Result parseResult(String userAgent) {
    return Result(
      browser: parseBrowser(userAgent),
      engine: parseEngine(userAgent),
      os: parseOS(userAgent),
      device: parseDevice(userAgent),
      cpu: parseCPU(userAgent),
    );
  }

  /// Parse a [Browser] from the [userAgent] string.
  ///
  /// Returns `null` if no match.
  Browser? parseBrowser(String userAgent) {
    for (BrowserParser browserParser in browserParsers) {
      for (String regex in browserParser.regexes) {
        RegExp regExp = RegExp(regex, caseSensitive: false);

        if (regExp.hasMatch(userAgent)) {
          Iterable<RegExpMatch> matches = regExp.allMatches(userAgent);
          String unformattedName = matches.first.namedGroup('unformattedName')!;
          String version = matches.first.namedGroup('version') ?? '';

          return Browser(
            name: browserParser.name,
            unformattedName: unformattedName,
            version: version,
            type: browserParser.type,
            parsedWithRegex: regex,
          );
        }
      }
    }

    return null;
  }

  /// Parse an [Engine] from the [userAgent] string.
  ///
  /// Returns `null` if no match.
  Engine? parseEngine(String userAgent) {
    for (EngineParser engineParser in engineParsers) {
      for (String regex in engineParser.regexes) {
        RegExp regExp = RegExp(regex, caseSensitive: false);

        if (regExp.hasMatch(userAgent)) {
          Iterable<RegExpMatch> matches = regExp.allMatches(userAgent);
          String unformattedName =
              matches.first.namedGroup('unformattedName') ??
                  engineParser.name.toLowerCase();
          String version = matches.first.namedGroup('version') ?? '';

          return Engine(
            name: engineParser.name,
            unformattedName: unformattedName,
            version: version,
            parsedWithRegex: regex,
          );
        }
      }
    }

    return null;
  }

  /// Parse an [OS] from the [userAgent] string.
  ///
  /// Returns `null` if no match.
  OS? parseOS(String userAgent) {
    for (OSParser osParser in osParsers) {
      for (String regex in osParser.regexes) {
        RegExp regExp = RegExp(regex, caseSensitive: false);

        if (regExp.hasMatch(userAgent)) {
          Iterable<RegExpMatch> matches = regExp.allMatches(userAgent);
          RegExpMatch match = matches.first;
          String version = match.groupCount > 0 ? match.group(1)! : '';

          return OS(
            name: osParser.name,
            unformattedName: osParser.name.toLowerCase(),
            version: version,
            parsedWithRegex: regex,
          );
        }
      }
    }

    return null;
  }

  /// Parse a [Device] from the [userAgent] string.
  ///
  /// Returns `null` if no match.
  Device? parseDevice(String userAgent) {
    for (DeviceParser deviceParser in deviceParsers) {
      for (String regex in deviceParser.regexes) {
        RegExp regExp = RegExp(regex, caseSensitive: false);

        if (regExp.hasMatch(userAgent)) {
          return Device(
            type: deviceParser.type,
            vendor: deviceParser.vendor,
            model: deviceParser.model,
            parsedWithRegex: regex,
          );
        }
      }
    }

    return null;
  }

  /// Parse a [CPU] from the [userAgent] string.
  ///
  /// Returns `null` if no match.
  CPU? parseCPU(String userAgent) {
    for (CPUParser cpuParser in cpuParsers) {
      for (String regex in cpuParser.regexes) {
        RegExp regExp = RegExp(regex, caseSensitive: false);

        if (regExp.hasMatch(userAgent)) {
          return CPU(
            architecture: cpuParser.architecture,
            parsedWithRegex: regex,
          );
        }
      }
    }

    return null;
  }
}
