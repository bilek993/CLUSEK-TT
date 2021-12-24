part of 'core_cubit.dart';

@freezed
class CoreState with _$CoreState {
  const factory CoreState.initial({
    @Default(0) int selectedSubpage,
    @Default('') String inputFilePath,
    @Default('') String outputFilePath,
    @Default(true) bool automaticOutputFilePath,
    @Default(0.5) double threshold,
    @Default('DXGI_FORMAT_BC7_UNORM') String selectedAlgorithm,
    @Default(0x0) int wicFlagsMask,
    @Default(0x0) int texFilterMask,
    @Default(0x0) int texCompressMask,
    @Default(0x0) int ddsFlagsMask,
    @Default(false) bool loadingInProgress,
    @Default(false) bool errorReportedFromNative,
  }) = _Initial;
}
