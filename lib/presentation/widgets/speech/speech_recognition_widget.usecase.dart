import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_widget.dart';
import 'package:iyltdsu_voice/utility/material.wrapper.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'The widget that contains button, result and status widgets',
  type: SpeechRecognitionWidget,
)
Widget defaultSpeechRecognitionWidget(BuildContext context) {
  return createDefaultMaterialWidget(
    context,
    createDefaultWidgetInACard(
      context,
      const SpeechRecognitionWidget(
        state: SpeechState(isListening: true),
      ),
    ),
  );
}
