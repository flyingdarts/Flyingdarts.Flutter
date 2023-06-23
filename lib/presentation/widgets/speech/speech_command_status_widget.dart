import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/utility/material.wrapper.dart';
import '../../bloc/speech/speech_bloc.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'The widget the displays the button status',
  type: SpeechCommandStatus,
)
Widget defaultSpeechCommandStatus(BuildContext context) {
  return createDefaultMaterialWidget(
    context,
    const SpeechCommandStatus(
      state: SpeechState(isListening: true),
    ),
  );
}

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
