import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'presentation/bloc/speech_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

class SpeechService extends ChangeNotifier {
  late SpeechToText _speechToText;
  bool _isListening = false;
  bool _enabled = false;
  String lastEntry = "";
  String error = "";
  String currentLanguage = "";
  bool _available = false;
  void init() async{
    _speechToText = SpeechToText();
  }

  bool get isListening => _isListening;
  Future<List<String>> getLanguages() async {
    var locales = await _speechToText.locales();
    return locales.map((e) => e.name).toList();
  }
  Future<void> startListening() async {
    if (!_isListening) {
      _available =  await _speechToText.initialize();
      if (_available) {
        var locale = await _speechToText.systemLocale();
        currentLanguage = locale?.name ?? "";
        notifyListeners();
        _speechToText.listen(
          onResult: (SpeechRecognitionResult result) {
            // Handle the speech recognition result
            if (result.finalResult) {
              lastEntry = result.recognizedWords;
              if (!_isValidEntry(lastEntry)) {
                error = 'Failed validation: $lastEntry';
                lastEntry = "";
              } else {
                error = "Great success!";
              }
              notifyListeners();
            }
          },
        );
        _isListening = true;
      }
    }
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

  Future<void> stopListening() async {
    if (_isListening) {
      _speechToText.stop();
      _isListening = false;
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    if (result.finalResult) {
      lastEntry = result.recognizedWords;
    }
  }

  void shouldStartListening(bool listen) {
    _isListening = listen;
    _speechToText.isNotListening ? startListening() : stopListening();
  }
}
