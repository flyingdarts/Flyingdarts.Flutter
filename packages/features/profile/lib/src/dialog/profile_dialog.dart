import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui/ui.dart';

import '../state/profile_cubit.dart';

class ProfileDialog extends StatelessWidget {
  const ProfileDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = GetIt.I<ProfileCubit>();
    cubit.init();
    return SimpleDialog(
      key: const Key("ProfileDialog"),
      backgroundColor: MyTheme.primaryColor,
      contentPadding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 32.0),
      titlePadding: const EdgeInsets.all(24.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hi ${cubit.state.userName}',
            textAlign: TextAlign.center,
          ),
          Align(
            key: const Key("ProfileCloseDialog"),
            alignment: Alignment.topRight,
            child: InkWell(
              borderRadius: BorderRadius.circular(4),
              onTap: () => Navigator.pop(context),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.close,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      children: [
        Text(cubit.state.userId),
        Text(cubit.state.country),
        Text(cubit.state.email),
      ],
    );
  }
}
