import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_status.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_button.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_result.dart';

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
        SpeechRecognitionResult(state: state),
        SpeechRecognitionButton(state: state),
        SpeechRecognitionStatus(state: state),
      ],
    );
  }
}
