import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/app.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_button_widget.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpeechApp();
  }
}

@widgetbook.UseCase(
  name: 'Dashboard',
  type: WidgetbookDashboard,
)
Widget defaultDashoard(BuildContext context) {
  return const WidgetbookDashboard();
}

class WidgetbookDashboard extends StatelessWidget {
  const WidgetbookDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarButton(
          iconData: Icons.keyboard_command_key_rounded,
          onPressed: () => {},
        ),
        AppBarButton(
          iconData: Icons.access_alarm_outlined,
          onPressed: () => {},
        ),
        AppBarButton(
          iconData: Icons.g_translate_outlined,
          onPressed: () => {},
        ),
      ],
    );
  }
}
