import 'package:flutter/material.dart';
import 'package:flyingdarts_shared/wrappers/material.wrappers.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'keyboard_button.dart';

@widgetbook.UseCase(
  name: 'The button used for the keyboard',
  type: KeyboardButton,
)
Widget defaultKeyboardButton(BuildContext context) {
  return createDefaultMaterialWidget(
    context,
    KeyboardButton(
      disabled: false,
      input: '',
      onPressed: () => {},
    ),
  );
}
