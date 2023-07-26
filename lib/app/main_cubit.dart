import 'package:bloc/bloc.dart';
import 'package:flc_test_task/domain/user_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial()) {
    loadUserData();
  }

  void loadUserData() async {
    await Future.delayed(const Duration(seconds: 1)).then(
      (value) => emit(
        const MainStateLoaded(
          userData: UserData(stage: RegistrationStage.appMode),
        ),
      ),
    );
  }

  void selectMode(AppMode mode) => emit(
        MainState.loaded(
          userData: UserData(appMode: mode, stage: RegistrationStage.birthYear),
        ),
      );

  void selectYear(int year) {
    assert(state is MainStateLoaded, 'Wrong state');

    final currentState = state as MainStateLoaded;

    emit(
      currentState.copyWith(
        userData: currentState.userData.copyWith(
          birthYear: year,
          stage: RegistrationStage.results,
        ),
      ),
    );
  }
}
