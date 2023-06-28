// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iyltdsu_voice/main.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/gestures/speech_command_gesture_detector.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_button_widget.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_widget.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('SpeechPage has', () {
    testWidgets('a title', (tester) async {
      await tester.pumpWidget(const MyApp());

      const String expectedTitle = 'Flyingdarts';

      final titleFinder = find.text(expectedTitle);

      expect(titleFinder, findsOneWidget);
    });
    group('an AppBar', () {
      testWidgets('that exists', (tester) async {
        await tester.pumpWidget(const MyApp());

        final appBarFinder = find.byType(MyAppBar);

        expect(appBarFinder, findsOneWidget);
      });
      testWidgets('that has 2 AppBarButtons', (tester) async {
        await tester.pumpWidget(const MyApp());

        const int expectedNumberOfButtons = 2;

        final buttonFinder = find.byType(AppBarButton);

        expect(buttonFinder, findsNWidgets(expectedNumberOfButtons));
      });
    });

    testWidgets('a speech recognition widget', (tester) async {
      await tester.pumpWidget(const MyApp());

      final widgetFinder = find.byType(SpeechRecognitionWidget);

      expect(widgetFinder, findsOneWidget);
    });
  });
}
