import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/utility/material.wrapper.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'The button to use in the AppBar',
  type: AppBarButton,
)
Widget defaultAppBarButton(BuildContext context) {
  return createDefaultMaterialWidget(
    context,
    AppBarButton(
      iconData: Icons.abc,
      onPressed: () => {},
    ),
  );
}

class AppBarButton extends StatelessWidget {
  const AppBarButton(
      {super.key, required this.iconData, required this.onPressed});

  final IconData iconData;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      icon: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Icon(
          iconData,
          size: 28,
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
