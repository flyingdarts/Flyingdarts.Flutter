import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../theme.dart';
import '../bloc/camera/camera_bloc.dart';

class ScannerDialog extends StatelessWidget {
  const ScannerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanResult = context.watch<CameraBloc>().state.scanResult;
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: 200,
      height: 200,
    );

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
        Container(
          height: MediaQuery.of(context).size.height / 2,
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Builder(
              builder: (context) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    MobileScanner(
                      fit: BoxFit.contain,
                      scanWindow: scanWindow,
                      errorBuilder: (context, error, child) {
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
                        return Text(errorMessage);
                      },
                      onDetect: (capture) {
                        context
                            .read<CameraBloc>()
                            .add(CameraDetectedQrCode(capture));
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 100,
                        color: Colors.black.withOpacity(0.4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 120,
                                height: 50,
                                child: FittedBox(
                                  child: Text(
                                    scanResult?.barcodes.first.rawValue ??
                                        'Scan something!',
                                    overflow: TextOverflow.fade,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
