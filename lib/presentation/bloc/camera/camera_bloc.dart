import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'camera_state.dart';
part 'camera_event.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(const CameraState()) {
    on<CameraDetectedQrCode>(_onCameraDetectedQrCode);
  }

  Future<void> _onCameraDetectedQrCode(
    CameraDetectedQrCode event,
    Emitter<CameraState> emit,
  ) async {
    emit(state.copyWith(
      scanResult: event.scanResult,
    ));
  }
}
