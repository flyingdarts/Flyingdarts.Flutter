import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

import '../bloc/speech/speech_bloc.dart';
import '../widgets/speech/speech_command_button_widget.dart';
import '../widgets/speech/speech_command_result_widget.dart';
import '../widgets/speech/speech_command_status_widget.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'The only page in the app',
  type: SpeechPage,
)
Widget defaultSpeechPage(BuildContext context) {
  return Provider<SpeechBloc>(
      create: (_) => SpeechBloc()..init(),
      // we use `builder` to obtain a new `BuildContext` that has access to the provider
      builder: (context, child) {
        // No longer throws
        return const SpeechPage();
      }
    );
}

class SpeechPage extends StatelessWidget {
  const SpeechPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SpeechBloc>().state;

    return Scaffold(
      appBar: const MyAppBar(),
      body: Container(
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SpeechCommandResult(state: state),
              SpeechCommandButton(state: state),
              SpeechCommandStatus(state: state),
            ],
          ),
        ),
      ),
    );
  }
}