import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/bloc/language/language_cubit.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/pages/speech_page.dart';

class NavigationState {
  final int selectedPage;
  final List<Widget> pages;
  final bool isLoading;
  final bool isLoggedIn;

  NavigationState(
      this.selectedPage, this.pages, this.isLoading, this.isLoggedIn);

  NavigationState copyWith(
      {int? selectedPage,
      List<Widget>? pages,
      bool? isLoading,
      bool? isLoggedIn}) {
    return NavigationState(
      selectedPage ?? this.selectedPage,
      pages ?? this.pages,
      isLoading ?? this.isLoading,
      isLoggedIn ?? this.isLoggedIn,
    );
  }

  setLoading(bool isLoading) {
    copyWith(isLoading: isLoading);
  }

  factory NavigationState.defaults() {
    final navigationState = NavigationState(
      0, // Set your desired default value for selectedPage
      [
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (ctx) => SpeechBloc()..init()),
            BlocProvider(create: (ctx) => LanguageCubit()..init()),
          ],
          child: const SpeechPage(),
        )
      ],
      true,
      false,
    );
    return navigationState;
  }
}
