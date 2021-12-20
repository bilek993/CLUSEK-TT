import 'package:clusek_tt/services/directxtex_bridge_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

GetIt locator = GetIt.asNewInstance();

class Locator {
  Locator._();

  static void config() {
    locator.reset(dispose: false);

    locator
        .registerLazySingleton<Logger>(() => Logger(printer: PrettyPrinter()));
    locator.registerLazySingleton<DirectxtexBridgeService>(
        () => DirectxtexBridgeService());
  }
}
