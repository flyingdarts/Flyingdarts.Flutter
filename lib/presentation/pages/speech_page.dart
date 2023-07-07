import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/bloc/language/language_cubit.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_recognition_widget.dart';
import 'package:iyltdsu_voice/utility/material.wrappers.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

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
        BlocProvider(create: (ctx) => LanguageCubit()..init()),
      ],
      child: const SpeechPage(),
    ),
  );
}

class SpeechPage extends StatefulWidget with WidgetsBindingObserver {
  const SpeechPage({Key? key}) : super(key: key);

  @override
  State<SpeechPage> createState() => _SpeechPageState();
}

class _SpeechPageState extends State<SpeechPage> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<SpeechBloc>().state;
    final languageState = context.watch<LanguageCubit>().state;
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            alignment: Alignment.center,
            child: buildSpeechRecognitionWidget(context, state, languageState),
          ),
        ],
      ),
    );
  }
}
