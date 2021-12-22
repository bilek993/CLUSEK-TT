import 'dart:ffi';

import 'package:clusek_tt/extensions/integer_to_bool.dart';
import 'package:ffi/ffi.dart';

typedef CompressAndConvertToDdsFunction = Uint8 Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
  Uint64,
  Uint64,
  Uint64,
  Uint64,
);
typedef CompressAndConvertToDdsFunctionDart = int Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
  int,
  int,
  int,
  int,
);

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

  bool compressAndConvertToDds(
    String inputPath,
    String outputPath,
    String compressionAlgorithm,
    int wicFlagsMask,
    int texFilterMask,
    int texCompressMask,
    int ddsFlagsMask,
  ) {
    int nativeFunctionResult = _compressAndConvertToDdsFunction(
      inputPath.toNativeUtf8(),
      outputPath.toNativeUtf8(),
      compressionAlgorithm.toNativeUtf8(),
      wicFlagsMask,
      texFilterMask,
      texCompressMask,
      ddsFlagsMask,
    );
    return nativeFunctionResult.nativeIntegerToBool();
  }
}
