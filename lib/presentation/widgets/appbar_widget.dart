import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_button_widget.dart';
import 'package:provider/provider.dart';

import '../bloc/camera/camera_bloc.dart';
import '../bloc/speech/speech_bloc.dart';
import '../dialogs/language_dialog.dart';
import '../dialogs/scanner_dialog.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'The button to use in the AppBar',
  type: MyAppBar,
)
MyAppBar defaultMyAppBr(BuildContext context) {
  return const MyAppBar();
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        AppBarButton(
          key: const Key("QrCodeScannerButton"),
          iconData: Icons.qr_code_scanner_rounded,
          onPressed: () => {
            showDialog<void>(
              context: context,
              builder: (dContext) => Provider<CameraBloc>(
                create: (_) => context.watch<CameraBloc>(),
                builder: (context, child) {
                  return const ScannerDialog();
                },
              ),
            ),
          },
        ),
        AppBarButton(
          key: const Key("SettingsButton"),
          iconData: Icons.settings,
          onPressed: () => {
            showDialog<void>(
              context: context,
              builder: (dContext) => LanguageDialog(
                languages: context.read<SpeechBloc>().state.languages,
              ),
            )
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
