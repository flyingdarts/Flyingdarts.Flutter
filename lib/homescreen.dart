import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/bloc/language/language_state.dart';
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
          SpeechRecognitionWidget(
            state: const SpeechState(
              isListening: false,
              error: '',
              lastEntry: '',
            ),
            languageState: LanguageState('Nederlands (Verenigde Staten)', []),
          ),
        )
      ],
    );
  }
}
