import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:path/path.dart' as path;
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class DartboardWidget extends StatelessWidget {
  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadFile(getAbsoluteFilePath('dartboard.html'));

  @override
  Widget build(BuildContext context) {
    return Center(
        // child: WebViewWidget.fromPlatform(
        //   platform:
        //       Platform.isAndroid ? AndroidWebViewWidget() : WebKitWebViewWidget(),
        // ),
        );
  }

  static String getAbsoluteFilePath(String relativePath) {
    final currentDirectory = path.dirname(Platform.script.toFilePath());
    return path.normalize(path.join(currentDirectory, relativePath));
  }
}
