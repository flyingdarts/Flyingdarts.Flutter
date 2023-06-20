import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/presentation/bloc/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/pages/speech_page.dart';
import 'package:iyltdsu_voice/speech_service.dart';
import 'package:iyltdsu_voice/theme.dart';

/// App widget that wraps the flutter app.
class SpeechApp extends StatelessWidget {
  /// Constructor
  const SpeechApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flyingdarts',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: MyTheme.secondaryColor,
        scaffoldBackgroundColor: MyTheme.primaryColor,
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0,
          color: Colors.transparent,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: MyTheme.secondaryColor,
            minimumSize: const Size(64, 48),
            textStyle: const TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: MyTheme.primaryColor,
            minimumSize: const Size(64, 48),
            side: const BorderSide(width: 1, color: MyTheme.primaryColor),
            textStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: MyTheme.primaryColor,
            minimumSize: const Size(64, 48),
            textStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: BlocProvider(
        create: (ctx) =>
            SpeechBloc(ctx.read<SpeechService>()),
        child: const SpeechPage(),
      ),
    );
  }
}
