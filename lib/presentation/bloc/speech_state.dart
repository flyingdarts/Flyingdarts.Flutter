part of 'speech_bloc.dart';

class SpeechState extends Equatable {
  final bool isListening;
  final String lastEntry;
  final bool enabled;
  final String error;
  final String currentLanguage;

  const SpeechState({
    this.isListening = false,
    this.lastEntry = "?",
    this.enabled = true,
    this.error = "",
    this.currentLanguage = ""
  });

  @override
  List<Object> get props => [
    isListening,
    lastEntry,
    enabled,
    error,
    currentLanguage
  ];

  SpeechState copyWith({
    bool? isListening,
    String? lastEntry,
    bool? enabled,
    String? error,
    String? currentLanguage
  }) =>
      SpeechState(
        isListening: isListening ?? this.isListening,
        lastEntry: lastEntry ?? this.lastEntry,
        enabled: enabled ?? this.enabled,
        error: error ?? this.error,
        currentLanguage: currentLanguage ?? this.currentLanguage
      );
}
