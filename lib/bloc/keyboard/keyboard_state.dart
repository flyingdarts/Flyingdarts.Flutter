class KeyboardState {
  const KeyboardState(
    this.lastInput,
    this.shouldDisableNumpad,
    this.shouldDiableShortcuts,
  );

  final int lastInput;
  final bool shouldDisableNumpad;
  final bool shouldDiableShortcuts;

  KeyboardState copyWith({
    int? lastInput,
    bool? shouldDisableNumpad,
    bool? shouldDiableShortcuts,
  }) {
    return KeyboardState(
      lastInput ?? this.lastInput,
      shouldDisableNumpad ?? this.shouldDisableNumpad,
      shouldDiableShortcuts ?? this.shouldDiableShortcuts,
    );
  }
}
