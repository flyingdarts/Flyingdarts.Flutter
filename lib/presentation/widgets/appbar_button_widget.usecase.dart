import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_button_widget.dart';
import 'package:iyltdsu_voice/utility/material.wrapper.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'The button to use in the AppBar',
  type: AppBarButton,
)
Widget defaultAppBarButtonWidget(BuildContext context) {
  return createDefaultMaterialWidget(
    context,
    AppBarButton(
      iconData: Icons.abc,
      onPressed: () => {},
    ),
  );
}
