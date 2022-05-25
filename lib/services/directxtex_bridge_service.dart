import 'dart:ffi';

import 'package:clusek_tt/extensions/integer_to_bool_extension.dart';
import 'package:clusek_tt/services/locator.dart';
import 'package:ffi/ffi.dart';
import 'package:logger/logger.dart';

typedef CompressAndConvertToDdsFunction = Uint8 Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
  Uint64,
  Bool,
  Uint64,
  Bool,
  Uint64,
  Uint64,
  Double,
);
typedef CompressAndConvertToDdsFunctionDart = int Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
  int,
  bool,
  int,
  bool,
  int,
  int,
  double,
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
    bool mipmapEnabled,
    int texFilterMask,
    bool compressionEnabled,
    int texCompressMask,
    int ddsFlagsMask,
    double threshold,
  ) {
    _log.d('Calling `compressAndConvertToDds` native function with params:');
    _log.d('inputPath: $inputPath');
    _log.d('outputPath: $outputPath');
    _log.d('compressionAlgorithm: $compressionAlgorithm');
    _log.d('wicFlagsMask: $wicFlagsMask');
    _log.d('mipmapEnabled: $mipmapEnabled');
    _log.d('texFilterMask: $texFilterMask');
    _log.d('compressionEnabled: $compressionEnabled');
    _log.d('texCompressMask: $texCompressMask');
    _log.d('ddsFlagsMask: $ddsFlagsMask');
    _log.d('threshold: $threshold');

    int nativeFunctionResult = _compressAndConvertToDdsFunction(
      inputPath.toNativeUtf8(),
      outputPath.toNativeUtf8(),
      compressionAlgorithm.toNativeUtf8(),
      wicFlagsMask,
      mipmapEnabled,
      texFilterMask,
      compressionEnabled,
      texCompressMask,
      ddsFlagsMask,
      threshold,
    );
    return nativeFunctionResult.nativeIntegerToBool();
  }
}
