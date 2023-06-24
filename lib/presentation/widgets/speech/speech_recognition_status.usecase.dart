import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_status.dart';
import 'package:iyltdsu_voice/utility/material.wrappers.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'The widget the displays the button status',
  type: SpeechRecognitionStatus,
)
Widget defaultSpeechRecognitionStatusWidget(BuildContext context) {
  return createDefaultMaterialWidget(
    context,
    createDefaultWidgetInACard(
      context,
      const SpeechRecognitionStatus(
        state: SpeechState(isListening: true),
      ),
    ),
  );
}
