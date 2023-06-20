import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/presentation/cubit/language_cubit.dart';
import 'package:iyltdsu_voice/theme.dart';

/// Dialog of the game's statistics.
class LanguageDialog extends StatelessWidget {
  /// Constructor
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languages = context.watch<LanguageCubit>().state.languages;

    return SimpleDialog(
      backgroundColor: MyTheme.primaryColor,
      contentPadding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 32.0),
      titlePadding: const EdgeInsets.all(24.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Languages',
            textAlign: TextAlign.center,
          ),
          Align(
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
        Container(
          height: MediaQuery.of(context).size.height / 2,
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...languages
                          .map(
                            (String item) => Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                                  child: Text(item),
                                ),
                              ],
                            ),
                          )
                          .toList()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
