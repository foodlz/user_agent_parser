import 'package:user_agent_parser_plus/results/browser.dart';
import 'package:user_agent_parser_plus/results/engine.dart';
import 'package:user_agent_parser_plus/results/os.dart';
import 'package:user_agent_parser_plus/results/device.dart';
import 'package:user_agent_parser_plus/results/cpu.dart';

class Result {
  Browser? browser;
  Engine? engine;
  OS? os;
  Device? device;
  CPU? cpu;

  Result({
    this.browser,
    this.engine,
    this.os,
    this.device,
    this.cpu,
  });
}
