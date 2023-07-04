import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/bloc/app/navigation_cubit.dart';
import 'package:iyltdsu_voice/bloc/camera/camera_bloc.dart';
import 'package:iyltdsu_voice/bloc/language/language_cubit.dart';
import 'package:iyltdsu_voice/presentation/dialogs/language_dialog.dart';
import 'package:iyltdsu_voice/presentation/dialogs/scanner_dialog.dart';
import 'package:iyltdsu_voice/presentation/widgets/appbar_button_widget.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = Provider.of<NavigationCubit>(context, listen: false);
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
      actions: cubit.state.isLoggedIn ? _buildAppBarButtons(context) : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  List<Widget> _buildAppBarButtons(BuildContext context) {
    return <Widget>[
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
              languages: context.read<LanguageCubit>().state.availableLanguages,
            ),
          )
        },
      ),
      AppBarButton(
        key: const Key("LogoutButton"),
        iconData: Icons.logout,
        onPressed: () async {
          var cubit = Provider.of<NavigationCubit>(context, listen: false);
          cubit.setIsLoading(true);
          try {
            await Amplify.Auth.signOut();
            // Sign out successful
            // Redirect or navigate to the desired page
          } on AuthException catch (e) {
            // Sign out failed
            // Handle the exception or display an error message
            print('Sign out failed: ${e.message}');
          }
        },
      ),
    ];
  }
}
