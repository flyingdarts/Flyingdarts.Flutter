import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/bloc/app/navigation_cubit.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_widget.dart';
import 'package:iyltdsu_voice/presentation/widgets/login_with_facebook_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<NavigationCubit>();
    return Scaffold(
      appBar: const MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: LoginWithFacebookButton(
                    onPressed: () async {
                      await _signInAsync();
                      cubit.setIsLoading(true);
                    },
                    child: const Flex(
                      direction: Axis.horizontal,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.facebook,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        Text("Login with facebook")
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signInAsync() async {
    try {
      SignInResult signInResult =
          await Amplify.Auth.signInWithWebUI(provider: AuthProvider.facebook);

      if (signInResult.isSignedIn) {
        // User is logged in, perform desired actions
        // Redirect to another screen, show a success message, etc.
      } else {
        // Login failed, handle the error
        // Show an error message, reset the form, etc.
      }
    } catch (e) {
      // Handle the authentication error
      print('Authentication error: $e');
    }
  }
}
