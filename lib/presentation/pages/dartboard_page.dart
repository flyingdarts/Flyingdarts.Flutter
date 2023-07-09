import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DartboardPage extends StatelessWidget {
  InAppWebViewController? webViewController;
  InAppWebViewOptions settings = InAppWebViewOptions();

  DartboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InAppWebView(
        initialFile: "assets/dartboard.html",
        onWebViewCreated: (controller) async {
          webViewController = controller;
        },
        onConsoleMessage: (controller, consoleMessage) {
          print(consoleMessage);
        },
      ),
    );
  }
}
