import 'dart:ffi';

import 'package:clusek_tt/extensions/integer_to_bool.dart';
import 'package:clusek_tt/services/locator.dart';
import 'package:ffi/ffi.dart';
import 'package:logger/logger.dart';

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
  final Logger _log = locator.get();

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
    _log.d('Calling `compressAndConvertToDds` native function with params:');
    _log.d('inputPath: $inputPath');
    _log.d('outputPath: $outputPath');
    _log.d('compressionAlgorithm: $compressionAlgorithm');
    _log.d('wicFlagsMask: $wicFlagsMask');
    _log.d('texFilterMask: $texFilterMask');
    _log.d('texCompressMask: $texCompressMask');
    _log.d('ddsFlagsMask: $ddsFlagsMask');

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
