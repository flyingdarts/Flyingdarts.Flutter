import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';
import '../bloc/camera/camera_bloc.dart';
import '../bloc/speech/speech_bloc.dart';
import '../dialogs/language_dialog.dart';
import '../dialogs/scanner_dialog.dart';

class SpeechPage extends StatelessWidget {
  const SpeechPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Flyingdarts',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            alignment: Alignment.center,
            icon: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.qr_code_scanner_rounded,
                size: 28,
                color: Colors.white,
              ),
            ),
            onPressed: () => showDialog<void>(
              context: context,
              builder: (dContext) => Provider<CameraBloc>(
                  create: (_) => context.watch<CameraBloc>(),
                  // we use `builder` to obtain a new `BuildContext` that has access to the provider
                  builder: (context, child) {
                    // No longer throws
                    return const ScannerDialog();
                  }),
            ),
          ),
          IconButton(
            alignment: Alignment.center,
            icon: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.settings,
                size: 28,
                color: Colors.white,
              ),
            ),
            onPressed: () => showDialog<void>(
              context: context,
              builder: (dContext) => LanguageDialog(
                  languages: context.read<SpeechBloc>().state.languages),
            ),
          )
        ],
      ),
      body: const SafeArea(
        child: _Speech(),
      ),
    );
  }
}

class _Speech extends StatefulWidget {
  const _Speech({Key? key}) : super(key: key);

  @override
  State<_Speech> createState() => _SpeechState();
}

class _SpeechState extends State<_Speech> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<SpeechBloc>().state;
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            state.lastEntry,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 72,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Text(
            state.error,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Text(
            state.currentLanguage,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onLongPress: () => {
              // long press confirmed
              // logger.i("onLongPress"),
              // _shouldStartListening(true),
              context.read<SpeechBloc>().add(const SpeechButtonLongPressed()),
            },
            onLongPressEnd: (details) => {
              // same as longpressup
              // logger.i("onLongPressEnd"),
              // _shouldStartListening(false),
              context.read<SpeechBloc>().add(const SpeechButtonLongPressEnded())
            },
            onLongPressCancel: () => {
              // logger.i("onLongPressCancel"),
              // _shouldStartListening(false),
              context
                  .read<SpeechBloc>()
                  .add(const SpeechButtonLongPressCancelled())
            },
            child: IconButton(
              iconSize: 300,
              icon: Icon(
                state.isListening ? Icons.mic_outlined : Icons.mic_none,
              ),
              color: MyTheme.secondaryColor,
              // the method which is called
              // when button is pressed
              onPressed: () {
                // setState(
                //   () {},
                // );
              },
            ),
          ),
          Text(
            state.isListening
                ? "Listening"
                : state.enabled
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
    );
  }
}
