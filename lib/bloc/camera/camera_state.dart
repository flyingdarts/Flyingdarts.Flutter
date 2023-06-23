part of 'camera_bloc.dart';

class CameraState extends Equatable {
  final BarcodeCapture? scanResult;

  const CameraState({
    this.scanResult,
  });

  @override
  List<Object> get props => [scanResult!];

  CameraState copyWith({
    BarcodeCapture? scanResult,
  }) =>
      CameraState(
        scanResult: scanResult ?? this.scanResult,
      );
}
