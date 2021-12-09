part of 'core_cubit.dart';

@freezed
class CoreState with _$CoreState {
  const factory CoreState.initial({
    @Default(0) int selectedSubpage,
  }) = _Initial;
}
