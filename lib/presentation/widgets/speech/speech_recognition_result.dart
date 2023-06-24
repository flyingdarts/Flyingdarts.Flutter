import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';

class SpeechRecognitionResult extends StatelessWidget {
  const SpeechRecognitionResult({
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
    );
  }
}
