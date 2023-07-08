import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyltdsu_voice/bloc/keyboard/keyboard_cubit.dart';
import 'package:iyltdsu_voice/presentation/pages/keyboard_button.dart';
import 'package:iyltdsu_voice/theme.dart';

class KeyboardPage extends StatelessWidget {
  KeyboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    var keyboardCubit = context.watch<KeyboardCubit>();

    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    KeyboardButton(
                      input: "CLEAR",
                      onPressed: () => {
                        keyboardCubit.clear(),
                      },
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            keyboardCubit.state.lastInput.toString(),
                            style: TextStyle(
                              fontSize: 40,
                              height: 0.8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 8,
                              right: 8,
                            ),
                            child: Divider(
                              thickness: 2,
                              color: MyTheme.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    KeyboardButton(
                      input: "CHECK",
                      onPressed: () => {
                        keyboardCubit.check(),
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Flexible(child: _buildTop(["CLEAR", "", "CHECK"])),

          _buildCenterFrom2d([
            [26, 1, 2, 3, 41],
            [45, 4, 5, 6, 60],
            [85, 7, 8, 9, 100]
          ], keyboardCubit),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KeyboardButton(
                    input: "NOSCORE",
                    onPressed: () => {
                      keyboardCubit.noScore(),
                    },
                  ),
                  KeyboardButton(
                    input: "0",
                    onPressed: () => {
                      keyboardCubit.setDigit(0),
                    },
                  ),
                  KeyboardButton(
                    input: "OK",
                    onPressed: () => {
                      keyboardCubit.ok(),
                    },
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: const Text(
              "Score sent",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Flexible(child: _buildTop(["NOSCORE", "0", "OK"])),
        ],
      ),
    );
  }

  Widget _buildCenterFrom2d(List<List<int>> keyNumbers, KeyboardCubit cubit) {
    List<Row> rows = [];
    for (var row in keyNumbers) {
      List<KeyboardButton> buttons = [];
      for (var key in row) {
        buttons.add(
          KeyboardButton(
            input: key.toString(),
            onPressed: () => [1, 2, 3, 4, 5, 6, 7, 8, 9].contains(key)
                ? cubit.setDigit(key)
                : cubit.setShortcut(key),
          ),
        );
      }
      rows.add(
        Row(
          children: buttons,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      );
    }
    return Column(children: rows);
  }

  Widget _buildTop(List<String> keys) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1.2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: keys
          .map(
            (e) => KeyboardButton(
              input: e,
              onPressed: () => debugPrint(e),
            ),
          )
          .toList(),
    );
  }
}
