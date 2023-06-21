import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/app.dart';
import 'package:provider/provider.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SpeechApp();
  }
}