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
  const SpeechButtonLongPressCancelled({this.lastEntry = ""}) : super();

  final String lastEntry;
}

class SpeechResultFound extends SpeechEvent {
  const SpeechResultFound(this.result);

  final String result;
}