import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DartboardPage extends StatelessWidget {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewOptions settings = InAppWebViewOptions();

  DartboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
              flex: 1,
              child: InAppWebView(
                key: webViewKey,
                initialFile: "assets/dartboard.html",
                onWebViewCreated: (controller) async {
                  webViewController = controller;
                },
                onConsoleMessage: (controller, consoleMessage) {
                  print(consoleMessage);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
