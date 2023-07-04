import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iyltdsu_voice/amplifyconfiguration.dart';
import 'package:iyltdsu_voice/bloc/app/navigation_cubit.dart';
import 'package:iyltdsu_voice/bloc/camera/camera_bloc.dart';
import 'package:iyltdsu_voice/bloc/language/language_cubit.dart';
import 'package:iyltdsu_voice/main.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/pages/speech_page.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_button_widget.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_widget.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_widget.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  AutomatedTestWidgetsFlutterBinding.ensureInitialized();

  bool isAmplifySuccessfullyConfigured = false;

  try {
    await _configureAmplify();
    isAmplifySuccessfullyConfigured = true;
  } on AmplifyAlreadyConfiguredException {
    debugPrint('Amplify configuration failed.');
  }

  group('the application has', () {
    testWidgets('a title', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MyApp(
          isAmplifySuccessfullyConfigured: isAmplifySuccessfullyConfigured,
        ));
      });

      const String expectedTitle = 'Flyingdarts';

      final titleFinder = find.text(expectedTitle);

      expect(titleFinder, findsOneWidget);
    });
    group('an AppBar', () {
      group('when logged in', () {
        testWidgets('that exists', (tester) async {
          await tester.runAsync(() async {
            await tester.pumpWidget(
              MultiBlocProvider(
                providers: [
                  BlocProvider<NavigationCubit>(
                      create: (ctx) => NavigationCubit()
                        ..initTest()
                        ..setIsLoggedIn(true)
                        ..setIsLoading(false)),
                  BlocProvider(create: (ctx) => SpeechBloc()..init()),
                  BlocProvider(create: (ctx) => CameraBloc()),
                  BlocProvider(create: (ctx) => LanguageCubit()..init()),
                ],
                child: const MaterialApp(
                  home: Material(
                    child: MyApp(isAmplifySuccessfullyConfigured: false),
                  ),
                ),
              ),
            );
          });
          await tester.pump();
          final appBarFinder = find.byType(MyAppBar);

          expect(appBarFinder, findsOneWidget);
        });

        testWidgets('that has 3 AppBarButtons', (tester) async {
          await tester.pumpWidget(BlocProvider<NavigationCubit>(
            create: (ctx) => NavigationCubit()
              ..initTest()
              ..setIsLoggedIn(true),
            child: const MaterialApp(home: Material(child: MyAppBar())),
          ));

          const int expectedNumberOfButtons = 3;
          final buttonFinder = find.byType(AppBarButton);

          expect(buttonFinder, findsNWidgets(expectedNumberOfButtons));
        });
      });
      group('when logged out', () {
        testWidgets('that exists when logged out', (tester) async {
          await tester.runAsync(() async {
            await tester.pumpWidget(
              MultiBlocProvider(
                providers: [
                  BlocProvider<NavigationCubit>(
                      create: (ctx) => NavigationCubit()
                        ..initTest()
                        ..setIsLoggedIn(false)
                        ..setIsLoading(false)),
                  BlocProvider(create: (ctx) => SpeechBloc()..init()),
                  BlocProvider(create: (ctx) => CameraBloc()),
                  BlocProvider(create: (ctx) => LanguageCubit()..init()),
                ],
                child: const MaterialApp(
                  home: Material(
                    child: MyApp(isAmplifySuccessfullyConfigured: false),
                  ),
                ),
              ),
            );
          });
          await tester.pump();
          final appBarFinder = find.byType(MyAppBar);

          expect(appBarFinder, findsOneWidget);
        });

        testWidgets('that has no AppBarButtons when logged out', (tester) async {
          await tester.pumpWidget(BlocProvider<NavigationCubit>(
            create: (ctx) => NavigationCubit()
              ..initTest()
              ..setIsLoggedIn(false),
            child: const MaterialApp(home: Material(child: MyAppBar())),
          ));

          final buttonFinder = find.byType(AppBarButton);

          expect(buttonFinder, findsNothing);
        });
      });
    });
  });

  testWidgets('a speech recognition widget', (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider<NavigationCubit>(
                create: (ctx) => NavigationCubit()
                  ..initTest()
                  ..setIsLoggedIn(true)
                  ..setIsLoading(false)),
            BlocProvider(create: (ctx) => SpeechBloc()..init()),
            BlocProvider(create: (ctx) => CameraBloc()),
            BlocProvider(create: (ctx) => LanguageCubit()..init()),
          ],
          child: const MaterialApp(
            home: Material(
              child: SpeechPage(),
            ),
          ),
        ),
      );
    });

    final widgetFinder = find.byType(SpeechRecognitionWidget);

    expect(widgetFinder, findsOneWidget);
  });
}

Future<void> _configureAmplify() async {
  await Amplify.addPlugins([
    AmplifyAuthCognito(),
  ]);
  await Amplify.configure(amplifyconfig);
}
