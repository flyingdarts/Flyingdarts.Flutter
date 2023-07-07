import 'package:flutter/material.dart';

class KeyboardButton extends StatelessWidget {
  const KeyboardButton({
    super.key,
    required this.input,
    required this.onPressed,
  });

  final String input;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          input,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
