import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/bloc/app/navigation_state.dart';
import 'package:iyltdsu_voice/bloc/camera/camera_bloc.dart';
import 'package:iyltdsu_voice/bloc/language/language_cubit.dart';
import 'package:iyltdsu_voice/bloc/speech/speech_bloc.dart';
import 'package:iyltdsu_voice/presentation/pages/home_page.dart';
import 'package:iyltdsu_voice/presentation/pages/speech_page.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.defaults());

  void setPage(int page) {
    emit(state.copyWith(selectedPage: page));
  }

  void setPages(List<Widget> pages) {
    emit(state.copyWith(pages: pages));
  }

  void setIsLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  void setIsLoggedIn(bool isLoggedIn) {
    emit(state.copyWith(isLoggedIn: isLoggedIn));
  }

  Future<void> init() async {
    setPage(0);
    setIsLoading(false);

    setupHubListener();
  }

  Future<void> initTest() async {
    setIsLoading(false);
    setPage(0);
  }

  void setupHubListener() {
    Amplify.Hub.listen(
      HubChannel.Auth,
      (AuthHubEvent event) {
        switch (event.type) {
          case AuthHubEventType.signedIn:
            print(state.isLoading);
            safePrint('The user has signed in lol.');
            setIsLoading(false);
            setIsLoggedIn(true);
            print(state.isLoading);
            break;
          case AuthHubEventType.signedOut:
            safePrint('The user has signed out lol.');
            setIsLoading(false);
            setIsLoggedIn(false);
            break;
          case AuthHubEventType.sessionExpired:
            safePrint('The session has expired.');
            break;
          case AuthHubEventType.userDeleted:
            safePrint('The user has been deleted.');
            break;
        }
      },
    );
  }
}
