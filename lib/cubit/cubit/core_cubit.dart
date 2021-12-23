import 'package:bloc/bloc.dart';
import 'package:clusek_tt/data/compression_algorithms.dart';
import 'package:clusek_tt/data/tex_compress_flags.dart';
import 'package:clusek_tt/data/tex_filter_flags.dart';
import 'package:clusek_tt/services/directxtex_bridge_service.dart';
import 'package:clusek_tt/services/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'core_cubit.freezed.dart';

part 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {
  final Logger _log = locator.get();
  final DirectxtexBridgeService _directxtexBridgeService = locator.get();

  CoreCubit() : super(const CoreState.initial());

  void changePage(int page) {
    if (page < 0) {
      _log.e('Value "$page" is incorrect! Changing page to the fist one...');
      emit(state.copyWith(selectedSubpage: 0));
      return;
    }

    emit(state.copyWith(selectedSubpage: page));
  }

  void setAlbedoPreset() {
    _log.i('Setting aldebo preset...');
    emit(const CoreState.initial(
      selectedAlgorithm: CompressionAlgorithms.bc1UnormSrgb,
      texCompressMask: TexCompressFlags.srgbIn,
    ));
  }

  void setEmissivePreset() {
    _log.i('Setting emissive preset...');
    emit(const CoreState.initial(
      selectedAlgorithm: CompressionAlgorithms.bc1UnormSrgb,
      texCompressMask: TexCompressFlags.srgbIn,
    ));
  }

  void setCombinedDataPreset() {
    _log.i('Setting combined data preset...');
    emit(const CoreState.initial(
      selectedAlgorithm: CompressionAlgorithms.bc7Unorm,
    ));
  }

  void setNormalPreset() {
    _log.i('Setting normal preset...');
    emit(const CoreState.initial(
      selectedAlgorithm: CompressionAlgorithms.bc5Unorm,
      texFilterMask: TexFilterFlags.rgbCopyRed | TexFilterFlags.rgbCopyGreen,
    ));
  }

  void setInputFilePath(String value) {
    if (state.automaticOutputFilePath) {
      String outputValue = value.replaceAll(RegExp(r'\.\w+$'), '.dds');
      emit(state.copyWith(inputFilePath: value, outputFilePath: outputValue));
    } else {
      emit(state.copyWith(inputFilePath: value));
    }
  }

  void setOutputFilePath(String value) {
    emit(state.copyWith(outputFilePath: value));
  }

  void setAutomaticOutputFilePath(bool value) {
    if (value) {
      String outputValue =
          state.inputFilePath.replaceAll(RegExp(r'\.\w+$'), '.dds');
      emit(state.copyWith(
        automaticOutputFilePath: value,
        outputFilePath: outputValue,
      ));
    } else {
      emit(state.copyWith(automaticOutputFilePath: value));
    }
  }

  void setAlgorithm(String value) {
    if (!CompressionAlgorithms.all.contains(value)) {
      _log.e('Incorrect algorithm!');
      return;
    }

    emit(state.copyWith(selectedAlgorithm: value));
  }

  void setThreshold(String thresholdAsText) {
    try {
      double thresholdAsNumeric = double.parse(thresholdAsText);
      emit(state.copyWith(threshold: thresholdAsNumeric));
    } catch (e) {
      _log.e(e.toString());
    }
  }

  void setWicFlagsMask(int mask) {
    emit(state.copyWith(wicFlagsMask: mask));
  }

  void setTexFilterMask(int mask) {
    emit(state.copyWith(texFilterMask: mask));
  }

  void setTexCompressMask(int mask) {
    emit(state.copyWith(texCompressMask: mask));
  }

  void setDdsFlagsMask(int mask) {
    emit(state.copyWith(ddsFlagsMask: mask));
  }

  void convert() {
    bool conversionSucceeded = _directxtexBridgeService.compressAndConvertToDds(
      state.inputFilePath,
      state.outputFilePath,
      state.selectedAlgorithm,
      state.wicFlagsMask,
      state.texFilterMask,
      state.texCompressMask,
      state.ddsFlagsMask,
      state.threshold,
    );
    _log.i('Conversion result: $conversionSucceeded');
  }
}
