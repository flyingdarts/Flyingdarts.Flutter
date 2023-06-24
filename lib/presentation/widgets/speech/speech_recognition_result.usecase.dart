import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_result.dart';
import 'package:iyltdsu_voice/utility/material.wrapper.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'The widget that displays the speech result',
  type: SpeechRecognitionResult,
)
Widget defaultSpeechRecognitionResultWidget(BuildContext context) {
  return createDefaultMaterialWidget(
    context,
    createDefaultWidgetInACard(
      context,
      SpeechRecognitionResult(
        state: SpeechState(
          lastEntry: "12",
          error: "Great success!",
          currentLanguage: const Locale('nl', 'US').toString(),
        ),
      ),
    ),
  );
}
