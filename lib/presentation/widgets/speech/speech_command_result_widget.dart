import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/utility/material.wrapper.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'The widget that displays the speech result',
  type: SpeechCommandResult,
)
Widget defaultSpeechCommandResult(BuildContext context) {
  return createDefaultMaterialWidget(
    context,
    SpeechCommandResult(
      state: SpeechState(
        lastEntry: "12",
        error: "Great success!",
        currentLanguage: const Locale('nl', 'US').toString(),
      ),
    ),
  );
}

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
