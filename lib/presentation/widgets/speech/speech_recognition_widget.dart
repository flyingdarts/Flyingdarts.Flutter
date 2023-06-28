import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/gestures/speech_command_gesture_detector.dart';
import 'package:iyltdsu_voice/theme.dart';

Widget buildSpeechRecognitionWidget(BuildContext context, SpeechState state) {
  return SpeechRecognitionWidget(
    state: state,
  );
}

class SpeechRecognitionWidget extends StatelessWidget {
  const SpeechRecognitionWidget({
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              state.lastEntry,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 72,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              state.error,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Text(
              state.currentLanguage,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpeechCommandGestureDetector(
              onLongPress: () => {
                context.read<SpeechBloc>().add(const SpeechButtonLongPressed()),
              },
              onLongPressEnd: (details) => {
                context
                    .read<SpeechBloc>()
                    .add(const SpeechButtonLongPressEnded())
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
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              key: const Key("SpeechCommandStatusText"),
              state.isListening
                  ? "Listening"
                  : state.enabled
                      ? "Hold the microphone"
                      : "Speech not available",
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
