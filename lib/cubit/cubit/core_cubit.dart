import 'package:bloc/bloc.dart';
import 'package:clusek_tt/services/locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'core_cubit.freezed.dart';

part 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {
  final Logger _log = locator.get();

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
  }

  void setEmissivePreset() {
    _log.i('Setting emissive preset...');
  }

  void setCombinedDataPreset() {
    _log.i('Setting combined data preset...');
  }

  void setNormalPreset() {
    _log.i('Setting normal preset...');
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
}
