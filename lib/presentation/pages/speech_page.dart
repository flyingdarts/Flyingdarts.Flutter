import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

import '../bloc/speech/speech_bloc.dart';
import '../widgets/speech/speech_command_button_widget.dart';
import '../widgets/speech/speech_command_result_widget.dart';
import '../widgets/speech/speech_command_status_widget.dart';

class SpeechPage extends StatelessWidget {
  const SpeechPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Container(
        alignment: Alignment.center,
        child: const SafeArea(
          child: _Speech(),
        ),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SpeechCommandResult(state: state),
        SpeechCommandButton(state: state),
        SpeechCommandStatus(state: state),
      ],
    );
  }
}





