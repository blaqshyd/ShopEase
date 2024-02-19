import 'dart:developer';

abstract class Logger {
  void logger(String msg) {}
}

class ConsoleLogger extends Logger {
  @override
  void logger(String msg) {
    log('Response: $msg');
    super.logger(msg);
  }
}

class FileLogger extends Logger {
  @override
  void logger(String msg) {
    log('log: $msg');
    super.logger(msg);
  }
}
