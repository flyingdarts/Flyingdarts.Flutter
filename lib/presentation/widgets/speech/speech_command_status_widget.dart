import 'package:flutter/material.dart';

import '../../bloc/speech/speech_bloc.dart';

class SpeechCommandStatus extends StatelessWidget {
  const SpeechCommandStatus({
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
    );
  }
}
