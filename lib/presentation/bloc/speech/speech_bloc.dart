import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'speech_state.dart';
part 'speech_event.dart';

/// Handles all logic related to the game.
class SpeechBloc extends Bloc<SpeechEvent, SpeechState> {
  SpeechBloc()
      : super(const SpeechState(
            isListening: false, lastEntry: "", enabled: true)) {
    on<SpeechButtonLongPressed>(_onSpeechButtonLongPressed);
    on<SpeechButtonLongPressEnded>(_onSpeechButtonLongPressEnded);
    on<SpeechButtonLongPressCancelled>(_onSpeechButtonLongPressCancelled);
    on<SpeechStartListeningEvent>(_onSpeechStartListening);
    on<SpeechStopListeningEvent>(_onSpeechStopListening);
    on<SpeechResultFoundEvent>(_onSpeechResultFound);
    on<GetSpeechLanguages>(_onGetSpeechLanguages);
  }
  Future<void> init() async {
    _speechToText = SpeechToText();
  }

  late SpeechToText _speechToText;

  Future<void> _onGetSpeechLanguages(
    GetSpeechLanguages event,
    Emitter<SpeechState> emit,
  ) async {
    final locales = await _speechToText.locales();
    final languages = locales.map((e) => e.name).toList();

    emit(state.copyWith(languages: languages));
  }

  Future<void> _onSpeechStartListening(
    SpeechStartListeningEvent event,
    Emitter<SpeechState> emit,
  ) async {
    var available = await _speechToText.initialize();
    if (available) {
      var locale = await _speechToText.systemLocale();
      add(const GetSpeechLanguages());
      _speechToText.listen(
        onResult: (SpeechRecognitionResult result) {
          // Handle the speech recognition result
          debugPrint(result.recognizedWords);
          if (result.finalResult || result.hasConfidenceRating) {
            var lastEntry = result.recognizedWords;
            if (!_isValidEntry(lastEntry)) {
              // ignore: invalid_use_of_visible_for_testing_member
              this.emit(state.copyWith(
                  lastEntry: "",
                  error: 'Failed validation: $lastEntry',
                  currentLanguage: locale?.name ?? ""));
            } else {
              // ignore: invalid_use_of_visible_for_testing_member
              this.emit(state.copyWith(
                  lastEntry: lastEntry,
                  error: "Great success!",
                  currentLanguage: locale?.name ?? ""));
            }
          }
        },
      );
    }
  }

  Future<void> _onSpeechStopListening(
    SpeechStopListeningEvent event,
    Emitter<SpeechState> emit,
  ) async {
    if (state.isListening) {
      _speechToText.stop();

      emit(state.copyWith(
        isListening: false,
      ));
    }
  }

  Future<void> _onSpeechResultFound(
    SpeechResultFoundEvent event,
    Emitter<SpeechState> emit,
  ) async {
    final result = state.lastEntry;
    debugPrint("Got a result :tada:");
    emit(state.copyWith(
      lastEntry: result,
    ));
  }

  Future<void> _onSpeechButtonLongPressed(
    SpeechButtonLongPressed event,
    Emitter<SpeechState> emit,
  ) async {
    add(const SpeechStartListeningEvent());

    const isListening = true;

    emit(state.copyWith(
      isListening: isListening,
    ));
  }

  Future<void> _onSpeechButtonLongPressEnded(
    SpeechButtonLongPressEnded event,
    Emitter<SpeechState> emit,
  ) async {
    add(const SpeechStopListeningEvent());
  }

  Future<void> _onSpeechButtonLongPressCancelled(
    SpeechButtonLongPressCancelled event,
    Emitter<SpeechState> emit,
  ) async {
    add(const SpeechStopListeningEvent());
  }

  bool _isValidEntry(String entry) {
    try {
      double value = double.parse(entry);
      if (value >= 0 && value <= 180) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
