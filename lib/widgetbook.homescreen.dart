import 'package:flutter/material.dart';
import 'package:flyingdarts_features/language/state/language_state.dart';
import 'package:flyingdarts_features/speech/state/speech_bloc.dart';
import 'package:flyingdarts_features/speech/widgets/speech_recognition_widget.dart';
import 'package:flyingdarts_shared/wrappers/material.wrappers.dart';
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
