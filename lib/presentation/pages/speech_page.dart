import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_widget.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_widget.dart';
import 'package:iyltdsu_voice/utility/material.wrapper.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../bloc/camera/camera_bloc.dart';

@widgetbook.UseCase(
  name: 'The only page in the app',
  type: SpeechPage,
)
Widget defaultSpeechPage(BuildContext context) {
  return createDefaultMaterialWidget(
    context,
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => SpeechBloc()..init()),
        BlocProvider(create: (ctx) => CameraBloc()),
      ],
      child: const SpeechPage(),
    ),
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
          child: buildSpeechRecognitionWidget(context, state),
        ),
      ),
    );
  }
}
