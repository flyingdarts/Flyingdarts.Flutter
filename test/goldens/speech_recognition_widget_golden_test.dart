import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/bloc/language/language_state.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_widget.dart';
import 'package:iyltdsu_voice/utility/material.wrappers.dart';

void main() {
  goldenTest(
    skip: true,
    'Speech recognition widget', // (1)
    fileName: 'speech_recognition_widget_golden_test', // (2)
    builder: () => GoldenTestGroup(
      // (3)
      children: [
        GoldenTestScenario(
          name: 'Initial state.',
          constraints: const BoxConstraints(maxWidth: 430), // (4)
          child: createDefaultCardWidget(
            SpeechRecognitionWidget(
              state: const SpeechState(
                isListening: false,
                error: '',
                lastEntry: '',
              ),
              languageState: LanguageState(
                'Nederlands (Verenigde Staten)',
                [],
              ),
            ),
          ),
        ),
        GoldenTestScenario(
          name: 'While listening.',
          constraints: const BoxConstraints(maxWidth: 430), // (4)
          child: createDefaultCardWidget(
            SpeechRecognitionWidget(
              state: const SpeechState(
                isListening: false,
                error: '',
                lastEntry: '',
              ),
              languageState: LanguageState(
                'Nederlands (Verenigde Staten)',
                [],
              ),
            ),
          ),
        ),
        GoldenTestScenario(
          name: 'When a good result has been found.',
          constraints: const BoxConstraints(maxWidth: 430), // (4)
          child: createDefaultCardWidget(
            SpeechRecognitionWidget(
              state: const SpeechState(
                isListening: false,
                error: '',
                lastEntry: '',
              ),
              languageState: LanguageState(
                'Nederlands (Verenigde Staten)',
                [],
              ),
            ),
          ),
        ),
        GoldenTestScenario(
          name: 'When a bad result has been found.',
          constraints: const BoxConstraints(maxWidth: 430), // (4)
          child: createDefaultCardWidget(
            SpeechRecognitionWidget(
              state: const SpeechState(
                isListening: false,
                error: '',
                lastEntry: '',
              ),
              languageState: LanguageState(
                'Nederlands (Verenigde Staten)',
                [],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
