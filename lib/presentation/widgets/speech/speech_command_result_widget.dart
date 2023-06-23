import 'package:flutter/material.dart';
import '../../bloc/speech/speech_bloc.dart';

class SpeechCommandResult extends StatelessWidget {
  const SpeechCommandResult({
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