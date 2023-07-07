import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/presentation/pages/keyboard_page.dart';
import 'package:iyltdsu_voice/utility/material.wrappers.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'The only page in the app',
  type: KeyboardPage,
)
Widget defaultKeyboardPage(BuildContext context) {
  return createDefaultMaterialWidget(
    context,
    KeyboardPage(),
  );
}
