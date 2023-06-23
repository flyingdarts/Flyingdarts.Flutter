import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/theme.dart';

Widget createDefaultMaterialWidget(BuildContext context, Widget child) {
  return MaterialApp(
    theme: myTheme,
    home: Material(
      child: child,
    ),
  );
}
