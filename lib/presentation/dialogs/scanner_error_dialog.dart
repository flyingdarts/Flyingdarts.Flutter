import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/errors/speech_error.dart';
import 'package:iyltdsu_voice/presentation/dialogs/error_dialog.dart';
import 'package:iyltdsu_voice/theme.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:iyltdsu_voice/utility/material.wrappers.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'A scanner error dialog',
  type: ScannerErrorDialog,
)
Widget defaultScannerErrorDialog(BuildContext context) {
  return createDefaultMaterialWidget(
    context,
    ScannerErrorDialog(
      error: SpeechError(
        const MobileScannerException(
          errorCode: MobileScannerErrorCode.genericError,
        ),
      ),
    ),
  );
}

class ScannerErrorDialog extends ErrorDialog<SpeechError> {
  const ScannerErrorDialog({
    super.key,
    required super.error,
  });

  @override
  Widget build(BuildContext context) {
    String errorMessage;

    switch (error.error.errorCode) {
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
            errorMessage,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            error.error.errorDetails?.message ?? '',
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
