import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_widget.dart';
import 'package:iyltdsu_voice/utility/material.wrappers.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Homescreen',
  type: WidgetbookHomescreen,
)
Widget defaultDashoard(BuildContext context) {
  return const WidgetbookHomescreen();
}

class WidgetbookHomescreen extends StatelessWidget {
  const WidgetbookHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        createDefaultCardWidget(
          const SpeechRecognitionWidget(
            state: SpeechState(
              isListening: false,
              currentLanguage: 'Nederlands (Verenigde Staten)',
              error: '',
              lastEntry: '',
            ),
          ),
        )
      ],
    );
  }
}
