import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../theme.dart';

final logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2, // number of method calls to be displayed
        errorMethodCount: 8, // number of method calls if stacktrace is provided
        lineLength: 120, // width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: true // Should each log print contain a timestamp  ),
        ));

class VoiceScoreInputWidget extends StatefulWidget {
  const VoiceScoreInputWidget({super.key});

  @override
  State<VoiceScoreInputWidget> createState() => _VoiceScoreInputWidgetState();
}

class _VoiceScoreInputWidgetState extends State<VoiceScoreInputWidget> {
  final SpeechToText _speechToText = SpeechToText();
  late LongPressGestureRecognizer _longPressRecognizer;
  bool _isListening = false;
  String _lastWords = "180";
  bool _speechEnabled = false;

  @override
  void initState() {
    super.initState();
    _longPressRecognizer = LongPressGestureRecognizer()
      ..onLongPress = _handlePress;
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
      _lastWords = result.recognizedWords;
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
    return Column(
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
          // onLongPressDown: (details) => {
          //   // first touch
          //   logger.i("onLongPressDown"),
          //   //_shouldStartListening(true)
          // },
          // onLongPressStart: (details) => {
          //   // long press detected
          //   logger.i("onLongPressStart"),
          //   _shouldStartListening(true)
          // },
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
              color: Colors.white),
        ),
      ],
    );
  }
}
