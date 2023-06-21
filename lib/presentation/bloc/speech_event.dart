part of 'speech_bloc.dart';

abstract class SpeechEvent extends Equatable {
  const SpeechEvent();

  @override
  List<Object> get props => [];
}

class SpeechButtonLongPress extends SpeechEvent {
  const SpeechButtonLongPress() : super();
}

class SpeechButtonLongPressEnded extends SpeechEvent {
  const SpeechButtonLongPressEnded() : super();
}

class SpeechButtonLongPressCancelled extends SpeechEvent {
  const SpeechButtonLongPressCancelled() : super();
}

class SpeechResultFound extends SpeechEvent {
  const SpeechResultFound(this.result);

  final String result;

  @override 
  List<Object> get props => [result];
}

class SpeechStartListening extends SpeechEvent {
  const SpeechStartListening() : super();
}

class SpeechStopListening extends SpeechEvent {
  const SpeechStopListening() : super();
}

class GetSpeechLanguages extends SpeechEvent {
  const GetSpeechLanguages() :super();
}