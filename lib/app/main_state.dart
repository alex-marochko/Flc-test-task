part of 'main_cubit.dart';

@freezed
sealed class MainState with _$MainState {
  const factory MainState.initial() = _Initial;

  const factory MainState.loaded({
    required UserData userData,
  }) = MainStateLoaded;
}
