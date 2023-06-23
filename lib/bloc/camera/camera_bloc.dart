import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:mockito/annotations.dart';

part 'camera_state.dart';
part 'camera_event.dart';

@GenerateNiceMocks([MockSpec<CameraBloc>()])

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final MobileScannerController controller = MobileScannerController();

  CameraBloc() : super(const CameraState()) {
    on<CameraDetectedQrCode>(_onCameraDetectedQrCode);
  }
  
  Future<void> _onCameraDetectedQrCode(
    CameraDetectedQrCode event,
    Emitter<CameraState> emit,
  ) async {
    debugPrint('camera detected qr code ${event.scanResult}');
    
    emit(state.copyWith(
      scanResult: event.scanResult,
    ));
  }
}
