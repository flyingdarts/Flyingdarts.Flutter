import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/gestures/speech_command_gesture_detector.dart';
import 'package:iyltdsu_voice/theme.dart';

class SpeechRecognitionButton extends StatelessWidget {
  const SpeechRecognitionButton({
    super.key,
    required this.state,
  });

  final SpeechState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpeechCommandGestureDetector(
          onLongPress: () => {
            context.read<SpeechBloc>().add(const SpeechButtonLongPressed()),
          },
          onLongPressEnd: (details) => {
            context.read<SpeechBloc>().add(const SpeechButtonLongPressEnded())
          },
          onLongPressCancel: () => {
            context
                .read<SpeechBloc>()
                .add(const SpeechButtonLongPressCancelled())
          },
          child: IconButton(
            iconSize: 300,
            icon: Icon(
              size: 300,
              state.isListening ? Icons.mic_outlined : Icons.mic_none,
            ),
            color: MyTheme.secondaryColor,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
