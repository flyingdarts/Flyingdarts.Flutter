class WebSocketState {
  const WebSocketState(this.isListening);

  final bool isListening;

  WebSocketState copyWith({
    bool? isListening,
  }) {
    return WebSocketState(
      isListening ?? this.isListening,
    );
  }
}
