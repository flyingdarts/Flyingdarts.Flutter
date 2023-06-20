import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/app.dart';
import 'package:iyltdsu_voice/speech_service.dart';
import 'package:provider/provider.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpeechService()..init(),
      child: const SpeechApp(),
    );
  }
}