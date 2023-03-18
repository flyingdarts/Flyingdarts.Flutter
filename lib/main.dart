import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'theme.dart';

final logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2, // number of method calls to be displayed
        errorMethodCount: 8, // number of method calls if stacktrace is provided
        lineLength: 120, // width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: true // Should each log print contain a timestamp  ),
        ));
final SpeechToText _speechToText = SpeechToText();
late LongPressGestureRecognizer _longPressRecognizer;
bool _isListening = false;
String _lastWords = "180";
bool _speechEnabled = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: MyTheme.primaryColor,
      ),
      home: const MyHomePage(title: 'Flyingdarts - Voice input'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _userWantsToScanQr = false;

  @override
  void initState() {
    super.initState();
    _longPressRecognizer = LongPressGestureRecognizer()..onLongPress = _handlePress;
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      if (result.finalResult) {
        _lastWords = result.recognizedWords;
      }
    });
  }

  @override
  void dispose() {
    _longPressRecognizer.dispose();
    super.dispose();
  }

  void _handlePress() {
    HapticFeedback.vibrate();
  }

  void _shouldStartListening(bool listen) {
    setState(() {
      _isListening = listen;
      _speechToText.isNotListening ? _startListening() : _stopListening();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: MyTheme.primaryColor.shade500,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            alignment: Alignment.centerRight,
            icon: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.qr_code_scanner_rounded,
                size: 28,
                color: Colors.white,
              ),
            ),
            onPressed: () => {
              setState(() => {_userWantsToScanQr = !_userWantsToScanQr})
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _userWantsToScanQr
                  ? MobileScanner(
                      fit: BoxFit.fill,
                      onDetect: (barcodeCapture) {
                        setState(() {
                          _userWantsToScanQr = !_userWantsToScanQr;
                        });
                        if (barcodeCapture.raw == null) {
                          debugPrint('Failed to scan Barcode');
                        } else {
                          final String qrCodeData = barcodeCapture.raw!;
                          if (Platform.isIOS) {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false, // user must tap button!
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  title: const Text('AlertDialog Title'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        const Text('This is a demo alert dialog.'),
                                        Text(qrCodeData),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Approve'),
                                      onPressed: () {
                                        setState(() {
                                          Navigator.pop(context);
                                        });
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('AlertDialog Title'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        const Text('This is a demo alert dialog.'),
                                        Text(qrCodeData),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Approve'),
                                      onPressed: () {
                                        setState(() {
                                          Navigator.pop(context);
                                        });
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Text(
                              _lastWords,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 72,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              "Great success!",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onLongPress: () => {
                            // long press confirmed
                            logger.i("onLongPress"),
                            _shouldStartListening(true),
                          },
                          onLongPressEnd: (details) => {
                            // same as longpressup
                            logger.i("onLongPressEnd"),
                            _shouldStartListening(false),
                          },
                          onLongPressCancel: () => {
                            logger.i("onLongPressCancel"),
                            _shouldStartListening(false),
                          },
                          child: IconButton(
                            iconSize: 300,
                            icon: Icon(
                              _isListening ? Icons.mic_outlined : Icons.mic_none,
                            ),
                            color: MyTheme.secondaryColor,
                            // the method which is called
                            // when button is pressed
                            onPressed: () {
                              setState(
                                () {},
                              );
                            },
                          ),
                        ),
                        Text(
                          _isListening
                              ? "Listening"
                              : _speechEnabled
                                  ? "Tap the microphone to start listening..."
                                  : "Speech not available",
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
