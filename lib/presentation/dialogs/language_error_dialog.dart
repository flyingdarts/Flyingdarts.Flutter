import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/presentation/dialogs/error_dialog.dart';
import 'package:iyltdsu_voice/theme.dart';
import 'package:iyltdsu_voice/utility/material.wrappers.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'A language error dialog',
  type: LanguageErrorDialog,
)
Widget defaultLanguageErrorDialog(BuildContext context) {
  return createDefaultMaterialWidget(
    context,
    const LanguageErrorDialog(error: "Could not find that language"),
  );
}

class LanguageErrorDialog extends ErrorDialog<String> {
  const LanguageErrorDialog({
    super.key,
    required super.error,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: MyTheme.primaryColor,
      contentPadding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 32.0),
      titlePadding: const EdgeInsets.all(24.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Oops, something went wrong',
            textAlign: TextAlign.center,
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              borderRadius: BorderRadius.circular(4),
              onTap: () => Navigator.pop(context),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.close,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Icon(Icons.error, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            error,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
