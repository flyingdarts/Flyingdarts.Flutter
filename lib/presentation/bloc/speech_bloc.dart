import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'speech_state.dart';
part 'speech_event.dart';

/// Handles all logic related to the game.
class SpeechBloc extends Bloc<SpeechEvent, SpeechState> {
  SpeechBloc()
      : super(const SpeechState(
            isListening: false, lastEntry: "", enabled: true)) {
    on<SpeechButtonLongPress>(_onSpeechButtonLongPressed);
    on<SpeechButtonLongPressEnded>(_onSpeechButtonLongPressEnded);
    on<SpeechButtonLongPressCancelled>(_onSpeechButtonLongPressCancelled);
    on<SpeechStartListening>(_onSpeechStartListening);
    on<SpeechStopListening>(_onSpeechStopListening);
    on<SpeechResultFound>(_onSpeechResultFound);
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
    SpeechStartListening event,
    Emitter<SpeechState> emit,
  ) async {
    var block = this;
    var available = await _speechToText.initialize();
    if (available) {
      var locale = await _speechToText.systemLocale();
      _speechToText.listen(
        onResult: (SpeechRecognitionResult result) {
          // Handle the speech recognition result
          debugPrint(result.recognizedWords);
          if (result.finalResult || result.hasConfidenceRating) {
            var lastEntry = result.recognizedWords;
            if (!_isValidEntry(lastEntry)) {
              block.emit(state.copyWith(
                  lastEntry: "",
                  error: 'Failed validation: $lastEntry',
                  currentLanguage: locale?.name ?? ""));
            } else {
              block.emit(state.copyWith(
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
    SpeechStopListening event,
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
    SpeechResultFound event,
    Emitter<SpeechState> emit,
  ) async {
    final result = state.lastEntry;

    emit(state.copyWith(
      lastEntry: result,
    ));
  }

  Future<void> _onSpeechButtonLongPressed(
    SpeechButtonLongPress event,
    Emitter<SpeechState> emit,
  ) async {
    add(const SpeechStartListening());

    const isListening = true;

    emit(state.copyWith(
      isListening: isListening,
    ));
  }

  Future<void> _onSpeechButtonLongPressEnded(
    SpeechButtonLongPressEnded event,
    Emitter<SpeechState> emit,
  ) async {
    add(const SpeechStopListening());
  }

  Future<void> _onSpeechButtonLongPressCancelled(
    SpeechButtonLongPressCancelled event,
    Emitter<SpeechState> emit,
  ) async {
    add(const SpeechStopListening());
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
