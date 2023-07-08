import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/bloc/keyboard/keyboard_state.dart';

class KeyboardCubit extends Cubit<KeyboardState> {
  KeyboardCubit()
      : super(
          const KeyboardState(0, false, false),
        );

  void setShortcut(int value) {
    emit(state.copyWith(lastInput: value, shouldDisableNumpad: true));
  }

  void setDigit(int digit) {
    var next = '${state.lastInput}$digit';
    emit(state.copyWith(
        lastInput: int.parse(next), shouldDiableShortcuts: true));
  }

  void clear() {
    emit(state.copyWith(lastInput: 0, shouldDisableNumpad: false));
  }

  void check() {
    emit(state.copyWith(lastInput: 0, shouldDisableNumpad: false));
  }

  void noScore() {
    emit(state.copyWith(lastInput: 0, shouldDisableNumpad: false));
  }

  void ok() {
    emit(state.copyWith(lastInput: 0, shouldDisableNumpad: false));
  }
}
