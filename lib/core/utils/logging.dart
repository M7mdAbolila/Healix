import 'package:flutter/foundation.dart' show kDebugMode;
import 'dart:developer' as developer;

class Logging {
  static void log(String message, {String tag = 'Healix'}) {
    if (kDebugMode) {
      developer.log(
        '[$tag] $message',
        time: DateTime.now(),
        name: 'HealixApp',
      );
    }
  }

  static void error(String message, {String tag = 'Healix-Error'}) {
    if (kDebugMode) {
      developer.log(
        '[$tag] $message',
        time: DateTime.now(),
        name: 'HealixApp',
        level: 1000, // Higher level for errors
      );
    }
  }

  static void warn(String message, {String tag = 'Healix-Warning'}) {
    if (kDebugMode) {
      developer.log(
        '[$tag] $message',
        time: DateTime.now(),
        name: 'HealixApp',
        level: 900, // Warning level
      );
    }
  }

  static void info(String message, {String tag = 'Healix-Info'}) {
    if (kDebugMode) {
      developer.log(
        '[$tag] $message',
        time: DateTime.now(),
        name: 'HealixApp',
        level: 800, // Info level
      );
    }
  }
}
