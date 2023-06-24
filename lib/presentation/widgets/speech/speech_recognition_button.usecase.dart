import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_button.dart';
import 'package:iyltdsu_voice/utility/material.wrappers.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'The button with a microphone',
  type: SpeechRecognitionButton,
)
Widget defaultSpeechRecogntionButtonWidget(BuildContext context) {
  return createDefaultWidgetInACard(
    context,
    const SpeechRecognitionButton(
      state: SpeechState(),
    ),
  );
}
