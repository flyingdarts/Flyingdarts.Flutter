part of 'camera_bloc.dart';

abstract class CameraEvent extends Equatable {
  const CameraEvent();

  @override
  List<Object> get props => [];
}

class CameraDetectedQrCode extends CameraEvent {
  const CameraDetectedQrCode(this.scanResult);

  final BarcodeCapture scanResult;

  @override 
  List<Object> get props => [scanResult];
}