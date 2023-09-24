import 'package:logger/logger.dart';

class AppLogger {
  
  static final _logger = Logger(printer: PrettyPrinter(
    colors: true,
    printEmojis: true,
    printTime: true,
  ));

  static void d(String message, {String? className, String? methodName}) {
    _logger.d('class: $className, method: $methodName, message: $message');
  }

  static void e(String message, Object stackTrace, {String? className, String? methodName}) {
    _logger.d('class: $className, method: $methodName, message: $message, stackTrace: $stackTrace');
  }
}