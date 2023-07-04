import 'package:flutter/material.dart';

class LoginWithFacebookButton extends ElevatedButton {
  LoginWithFacebookButton(
      {super.key, required super.onPressed, required super.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style,
      child: child,
    );
  }
}
