import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

GetIt locator = GetIt.asNewInstance();

class Locator {
  Locator._();

  static void config() {
    locator.reset(dispose: false);
    
    locator
        .registerLazySingleton<Logger>(() => Logger(printer: PrettyPrinter()));
  }
}
