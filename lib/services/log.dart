import 'package:logger/logger.dart';

class LogService {
  static d(String message) {
    final logger = Logger();
    logger.d(message);
  }

  static w(String message) {
    final logger = Logger();
    logger.w(message);
  }

  static e(String message) {
    final logger = Logger();
    logger.e(message);
  }
}
