import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/utility/material.wrapper.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../theme.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'An error dialog',
  type: ErrorDialog,
)
Widget defaultErrorDialog(BuildContext context) {
  return createDefaultMaterialWidget(
    context,
    const ErrorDialog(
      error: MobileScannerException(
          errorCode: MobileScannerErrorCode.genericError),
    ),
  );
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key? key, required this.error}) : super(key: key);

  final MobileScannerException error;

  @override
  Widget build(BuildContext context) {
    String errorMessage;

    switch (error.errorCode) {
      case MobileScannerErrorCode.controllerUninitialized:
        errorMessage = 'Controller not ready.';
        break;
      case MobileScannerErrorCode.permissionDenied:
        errorMessage = 'Permission denied';
        break;
      default:
        errorMessage = 'Generic Error';
        break;
    }
    return SimpleDialog(
      backgroundColor: MyTheme.primaryColor,
      contentPadding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 32.0),
      titlePadding: const EdgeInsets.all(24.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Scan the QR code',
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
        Text(
          errorMessage,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          error.errorDetails?.message ?? '',
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
