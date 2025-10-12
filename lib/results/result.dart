import 'package:user_agent_parser/results/browser.dart';
import 'package:user_agent_parser/results/engine.dart';
import 'package:user_agent_parser/results/os.dart';
import 'package:user_agent_parser/results/device.dart';
import 'package:user_agent_parser/results/cpu.dart';

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
