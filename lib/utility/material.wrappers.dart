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

Widget createDefaultWidgetInACard(BuildContext context, Widget child) {
  return Center(
    child: Container(
      color: MyTheme.primaryColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            shadowColor: MyTheme.secondaryColor,
            child: child,
          ),
        ],
      ),
    ),
  );
}
