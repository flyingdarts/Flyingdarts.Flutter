// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/presentation/bloc/camera/camera_bloc.dart';
import 'package:iyltdsu_voice/presentation/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/dialogs/error_dialog.dart';
import 'package:iyltdsu_voice/presentation/dialogs/language_dialog.dart';
import 'package:iyltdsu_voice/presentation/dialogs/scanner_dialog.dart';
import 'package:iyltdsu_voice/presentation/gestures/speech_command_gesture_detector.dart';
import 'package:iyltdsu_voice/presentation/pages/speech_page.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_button_widget.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_widget.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_command_button_widget.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_command_result_widget.dart';
import 'package:iyltdsu_voice/presentation/widgets/speech/speech_command_status_widget.dart';
import 'package:iyltdsu_voice/theme.dart';
import 'package:iyltdsu_voice/utility/material.wrapper.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook/widgetbook.dart';

final directories = [
  WidgetbookFolder(
    name: 'presentation',
    children: [
      WidgetbookFolder(
        name: 'widgets',
        children: [
          WidgetbookComponent(
            name: 'AppBarButton',
            useCases: [
              WidgetbookUseCase(
                name: 'The button to use in the AppBar',
                builder: (context) => defaultAppBarButton(context),
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'MyAppBar',
            useCases: [
              WidgetbookUseCase(
                name: 'The button to use in the AppBar',
                builder: (context) => defaultMyAppBr(context),
              ),
            ],
          ),
          WidgetbookFolder(
            name: 'speech',
            children: [
              WidgetbookComponent(
                name: 'SpeechCommandResult',
                useCases: [
                  WidgetbookUseCase(
                    name: 'The widget that displays the speech result',
                    builder: (context) => defaultSpeechCommandResult(context),
                  ),
                ],
              ),
              WidgetbookComponent(
                name: 'SpeechCommandStatus',
                useCases: [
                  WidgetbookUseCase(
                    name: 'The widget the displays the button status',
                    builder: (context) => defaultSpeechCommandStatus(context),
                  ),
                ],
              ),
              WidgetbookComponent(
                name: 'SpeechCommandButton',
                useCases: [
                  WidgetbookUseCase(
                    name: 'The button with a microphone',
                    builder: (context) => defaultSpeechCommandButton(context),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      WidgetbookFolder(
        name: 'dialogs',
        children: [
          WidgetbookComponent(
            name: 'LanguageDialog',
            useCases: [
              WidgetbookUseCase(
                name: 'A language dialog',
                builder: (context) => defaultLanguageDialog(context),
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'ErrorDialog',
            useCases: [
              WidgetbookUseCase(
                name: 'An error dialog',
                builder: (context) => defaultErrorDialog(context),
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'ScannerDialog',
            useCases: [
              WidgetbookUseCase(
                name: 'A scanner dialog',
                builder: (context) => defaultScannerDialog(context),
              ),
            ],
          ),
        ],
      ),
      WidgetbookFolder(
        name: 'pages',
        children: [
          WidgetbookComponent(
            name: 'SpeechPage',
            useCases: [
              WidgetbookUseCase(
                name: 'The only page in the app',
                builder: (context) => defaultSpeechPage(context),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
