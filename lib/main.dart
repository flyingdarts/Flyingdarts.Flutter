import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/app.dart';
import 'package:provider/provider.dart';
import 'package:mockito/annotations.dart';

import 'presentation/bloc/speech/speech_bloc.dart';

@GenerateMocks([SpeechState])
void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpeechApp();
  }
}