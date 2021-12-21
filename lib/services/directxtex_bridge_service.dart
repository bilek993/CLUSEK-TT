import 'dart:ffi';

import 'package:clusek_tt/extensions/integer_to_bool.dart';

typedef CompressAndConvertToDdsFunction = Uint8 Function();
typedef CompressAndConvertToDdsFunctionDart = int Function();

class DirectxtexBridgeService {
  late final DynamicLibrary _dynamicLibrary;
  late final CompressAndConvertToDdsFunctionDart
      _compressAndConvertToDdsFunction;

  DirectxtexBridgeService() {
    _dynamicLibrary = DynamicLibrary.open('directxtex_bridge.dll');

    _compressAndConvertToDdsFunction = _dynamicLibrary.lookupFunction<
        CompressAndConvertToDdsFunction,
        CompressAndConvertToDdsFunctionDart>('compressAndConvertToDds');
  }

  bool compressAndConvertToDds() {
    int nativeFunctionResult = _compressAndConvertToDdsFunction();
    return nativeFunctionResult.nativeIntegerToBool();
  }
}
