import 'dart:ffi';

typedef TemperatureFunction = Double Function();
typedef TemperatureFunctionDart = double Function();

class DirectxtexBridgeService {
  late final DynamicLibrary _dynamicLibrary;
  late final TemperatureFunctionDart _temperatureFunction;

  DirectxtexBridgeService() {
    _dynamicLibrary = DynamicLibrary.open('directxtex_bridge.dll');

    _temperatureFunction = _dynamicLibrary.lookupFunction<TemperatureFunction,
        TemperatureFunctionDart>('getTemperature');
  }

  double getTemperature() => _temperatureFunction();
}
