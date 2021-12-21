import 'dart:ffi';

typedef CompressAndConvertToDdsFunction = Uint8 Function();
typedef CompressAndConvertToDdsFunctionDart = int Function();

class DirectxtexBridgeService {
  late final DynamicLibrary _dynamicLibrary;
  late final CompressAndConvertToDdsFunctionDart _temperatureFunction;

  DirectxtexBridgeService() {
    _dynamicLibrary = DynamicLibrary.open('directxtex_bridge.dll');

    _temperatureFunction = _dynamicLibrary.lookupFunction<
        CompressAndConvertToDdsFunction,
        CompressAndConvertToDdsFunctionDart>('compressAndConvertToDds');
  }

  bool compressAndConvertToDds() => _temperatureFunction() == 1;
}
