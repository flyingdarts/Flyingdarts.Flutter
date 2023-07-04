import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_widget.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:iyltdsu_voice/utility/material.wrappers.dart';

@widgetbook.UseCase(
  name: 'The button to use in the AppBar',
  type: MyAppBar,
)
Widget defaultMyAppWidget(BuildContext context) {
  return createDefaultWidgetInACard(
    context,
    const MyAppBar(),
  );
}
