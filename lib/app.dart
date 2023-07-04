import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iyltdsu_voice/bloc/app/navigation_state.dart';
import 'package:iyltdsu_voice/presentation/pages/home_page.dart';
import 'package:iyltdsu_voice/presentation/pages/login_page.dart';
import 'package:iyltdsu_voice/utility/routes.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'bloc/app/navigation_cubit.dart';
import 'theme.dart';

/// App widget that wraps the flutter app.
class SpeechApp extends StatelessWidget {
  /// Constructor
  SpeechApp({
    Key? key,
    required this.isAmplifySuccessfullyConfigured,
  }) : super(key: key);

  final bool isAmplifySuccessfullyConfigured;
  late StreamSubscription<AuthHubEvent> subscription;

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<NavigationCubit>();

    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.home.name,
          builder: (context, state) => isAmplifySuccessfullyConfigured
              ? const MyHomePage()
              : const Scaffold(
                  body: Center(
                    child: Text(
                      'Tried to reconfigure Amplify; '
                      'this can occur when your app restarts on Android.',
                    ),
                  ),
                ),
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    );
    return Authenticator(
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        builder: (ctx, child) {
          return _buildPage(cubit.state);
        },
        theme: ThemeData(
          primaryColor: MyTheme.secondaryColor,
          scaffoldBackgroundColor: MyTheme.primaryColor,
          shadowColor: Theme.of(context).primaryColorDark,
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            elevation: 0,
            color: Colors.transparent,
          ),
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: MyTheme.secondaryColor,
              minimumSize: const Size(64, 48),
              textStyle: const TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              primary: MyTheme.primaryColor,
              minimumSize: const Size(64, 48),
              side: const BorderSide(width: 1, color: MyTheme.primaryColor),
              textStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: MyTheme.primaryColor,
              minimumSize: const Size(64, 48),
              textStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPage(NavigationState state) {
    if (state.isLoading) {
      return Scaffold(
        body: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.white,
            size: 200,
          ),
        ),
      );
    } else if (state.isLoggedIn) {
      return const MyHomePage();
    } else {
      return const LoginPage();
    }
  }
}
