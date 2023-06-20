import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iyltdsu_voice/speech_service.dart';
import 'package:provider/provider.dart';

part 'speech_state.dart';
part 'speech_event.dart';

/// Handles all logic related to the game.
class SpeechBloc extends Bloc<SpeechEvent, SpeechState> {
  SpeechBloc(this._speechService)
      : super(const SpeechState(
          isListening: false,
          lastEntry: "",
          enabled: true
        )) {
    on<SpeechButtonLongPress>(_onSpeechButtonLongPressed);
    on<SpeechButtonLongPressEnded>(_onSpeechButtonLongPressEnded);
    on<SpeechButtonLongPressCancelled>(_onSpeechButtonLongPressCancelled);
  }

  final SpeechService _speechService;

  Future<void> _onSpeechButtonLongPressed(
    SpeechButtonLongPress event,
    Emitter<SpeechState> emit,
  ) async {
    const isListening = true;

    _speechService.startListening();

    emit(state.copyWith(
      isListening: isListening,
    ));
  }

  Future<void> _onSpeechButtonLongPressEnded(
    SpeechButtonLongPressEnded event,
    Emitter<SpeechState> emit,
  ) async {
    await _speechService.stopListening();

    emit(state.copyWith(
      isListening: false,
    ));
  }

  Future<void> _onSpeechButtonLongPressCancelled(
    SpeechButtonLongPressCancelled event,
    Emitter<SpeechState> emit,
  ) async {
    await _speechService.stopListening();

    emit(state.copyWith(
      isListening: false,
    ));
  }
}
