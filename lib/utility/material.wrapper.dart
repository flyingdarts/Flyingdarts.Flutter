import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_button.dart';
import 'package:iyltdsu_voice/theme.dart';

Widget createDefaultMaterialWidget(BuildContext context, Widget child) {
  return MaterialApp(
    theme: myTheme,
    home: Material(
      child: child,
    ),
  );
}

Widget createDefaultWidgetInACard(BuildContext context, Widget child) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Card(
      shadowColor: MyTheme.secondaryColor,
      child: child,
    ),
  );
}
