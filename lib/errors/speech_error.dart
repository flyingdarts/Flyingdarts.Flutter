import 'package:iyltdsu_voice/errors/flyingdarts_error.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class SpeechError implements FlyingdartsError {
  SpeechError(this.error);

  final MobileScannerException error;

  @override
  String get errorMessage {
    switch (error.errorCode) {
      case MobileScannerErrorCode.controllerUninitialized:
        return 'Controller not ready.';
      case MobileScannerErrorCode.permissionDenied:
        return 'Permission denied';
      default:
        return 'Generic Error';
    }
  }
}
