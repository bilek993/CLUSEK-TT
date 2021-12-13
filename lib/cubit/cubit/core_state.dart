part of 'core_cubit.dart';

@freezed
class CoreState with _$CoreState {
  const factory CoreState.initial({
    @Default(0) int selectedSubpage,
    @Default('') String inputFilePath,
    @Default('') String outputFilePath,
    @Default(false) bool automaticOutputFilePath,
    @Default(0x0) int wicFlagsMask,
    @Default(0x0) int texFilterMask,
    @Default(0x0) int texCompressMask,
    @Default(0x0) int ddsFlagsMask,
  }) = _Initial;
}
