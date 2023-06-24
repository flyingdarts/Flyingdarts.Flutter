// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iyltdsu_voice/main.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/gestures/speech_command_gesture_detector.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_button_widget.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_widget.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_button.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_result.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_status.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('SpeechPage', () {
    testWidgets('has a title', (tester) async {
      await tester.pumpWidget(const MyApp());

      const String expectedTitle = 'Flyingdarts';

      final titleFinder = find.text(expectedTitle);

      expect(titleFinder, findsOneWidget);
    });
    group('AppBar', () {
      testWidgets('exists', (tester) async {
        await tester.pumpWidget(const MyApp());

        final appBarFinder = find.byType(MyAppBar);

        expect(appBarFinder, findsOneWidget);
      });
      testWidgets('has 2 AppBarButtons', (tester) async {
        await tester.pumpWidget(const MyApp());

        const int expectedNumberOfButtons = 2;

        final buttonFinder = find.byType(AppBarButton);

        expect(buttonFinder, findsNWidgets(expectedNumberOfButtons));
      });
    });

    testWidgets('has a SpeechCommandResult widget', (tester) async {
      await tester.pumpWidget(const MyApp());

      final buttonFinder = find.byType(SpeechRecognitionResult);

      expect(buttonFinder, findsOneWidget);
    });

    testWidgets('has a SpeechCommandButton widget', (tester) async {
      await tester.pumpWidget(const MyApp());

      final buttonFinder = find.byType(SpeechRecognitionButton);

      expect(buttonFinder, findsOneWidget);
    });

    testWidgets('has a SpeechCommandStatus widget', (tester) async {
      await tester.pumpWidget(const MyApp());

      final buttonFinder = find.byType(SpeechRecognitionStatus);

      expect(buttonFinder, findsOneWidget);
    });

    group('widget', () {
      SpeechState state = const SpeechState();

      Future<void> buildMaterialWidget(
        WidgetTester widgetTester,
        Widget widget,
      ) async {
        await widgetTester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Material(
                child: widget,
              ),
            ),
          ),
        );
      }

      group('SpeechCommandButton', () {
        Widget widget = SpeechRecognitionButton(state: state);
        testWidgets('has a SpeechCommandGestureDetector', (tester) async {
          await buildMaterialWidget(tester, widget);

          final gestureFinder = find.byType(SpeechCommandGestureDetector);

          expect(gestureFinder, findsOneWidget);
        });

        testWidgets('has an Icon widget', (tester) async {
          await buildMaterialWidget(tester, widget);

          final gestureFinder = find.byType(Icon);

          expect(gestureFinder, findsOneWidget);
        });
      });

      group('SpeechCommandResult', () {
        Widget widget = SpeechRecognitionResult(state: state);
        testWidgets('has three Text widgets', (tester) async {
          await buildMaterialWidget(tester, widget);

          const int numberOfExpectedTextFields = 3;

          final gestureFinder = find.byType(Text);

          expect(gestureFinder, findsNWidgets(numberOfExpectedTextFields));
        });
      });

      group('SpeechCommandStatus', () {
        Widget widget = SpeechRecognitionStatus(state: state);
        testWidgets('has one Text widget', (tester) async {
          await buildMaterialWidget(tester, widget);

          final gestureFinder = find.byType(Text);

          expect(gestureFinder, findsOneWidget);
        });
      });
    });
  });
}
