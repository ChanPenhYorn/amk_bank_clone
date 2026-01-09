import 'package:logger/logger.dart';

class AppLogger {
  static logTrack(String message) {
    Logger().t(" [LOG] : $message");
  }

  static logError(String message) {
    Logger().e(" [ERROR] : $message");
  }

  static logWarning(String message) {
    Logger().w(" [WARNING] : $message");
  }

  static logInfo(String message) {
    Logger().i(" [INFO] : $message");
  }

  static logDebug(String message) {
    Logger().d(" [DEBUG] : $message");
  }

  static logFatal(String message) {
    Logger().f(" [FATAL] : $message");
  }
}
