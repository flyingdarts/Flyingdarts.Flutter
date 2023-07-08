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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            input,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .primaryTextTheme
                .labelSmall
                ?.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
