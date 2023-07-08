import 'dart:async';
import 'package:rxdart/subjects.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketService<T extends WebSocketRequest> {
  IOWebSocketChannel? _socket;
  final BehaviorSubject<bool> _connectedSubject =
      BehaviorSubject<bool>.seeded(false);
  Stream<bool> get connected$ => _connectedSubject.stream;
  final StreamController<WebSocketMessage<T>> _messages =
      StreamController<WebSocketMessage<T>>.broadcast();
  Stream<WebSocketMessage<T>> get messages => _messages.stream;

  WebSocketService() {
    _initialize();
  }

  void _initialize() {
    _socket = IOWebSocketChannel.connect(
        'wss://ewwi6tm25a.execute-api.eu-west-1.amazonaws.com/Development');
    _connect();
  }

  void _connect() {
    _socket?.stream.listen(
      (event) {
        _connectedSubject.add(true);
        _messages.add(WebSocketMessage<T>(
          action: WebSocketActions.Connect,
          message: event as T,
        ));
      },
      onDone: () {
        _connectedSubject.add(false);
        _messages.add(WebSocketMessage<T>(
          action: WebSocketActions.Disconnect,
          message: null,
        ));
        Future.delayed(Duration(seconds: 1), () {
          _initialize();
        });
      },
      onError: (error) {
        _messages.add(WebSocketMessage<T>(
          action: WebSocketActions.Default,
          message: error as T,
        ));
      },
    );
  }

  void postMessage(String payload) {
    if (_connectedSubject.value) {
      _socket?.sink.add(payload);
    }
  }

  void dispose() {
    _connectedSubject.close();
    _messages.close();
    _socket?.sink.close();
  }
}

class WebSocketActions {
  static const Connect = "connect\$";
  static const Disconnect = "disconnect\$";
  static const Default = "default\$";
  static const RoomsOnCreate = "rooms/create";
  static const UserProfileCreate = "v2/user/profile/create";
  static const UserProfileUpdate = "v2/user/profile/update";
  static const UserProfileGet = "v2/user/profile/get";
  static const X01Create = "v2/games/x01/create";
  static const X01JoinQueue = "v2/games/x01/joinqueue";
  static const X01Score = "v2/games/x01/score";
  static const X01Join = "v2/games/x01/join";
}

class WebSocketMessage<T> {
  String action;
  T? message;

  WebSocketMessage({required this.action, this.message});

  factory WebSocketMessage.fromJson(Map<String, dynamic> json) {
    return WebSocketMessage<T>(
      action: json['action'],
      message: json['message'] as T,
    );
  }
}

enum WebSocketStatus {
  Unknown,
  Disconnected,
  Connected,
}

abstract class WebSocketRequest {}

class MessageRequest extends WebSocketRequest {
  late DateTime Date;
  late String Message;
  late String Owner;
}
