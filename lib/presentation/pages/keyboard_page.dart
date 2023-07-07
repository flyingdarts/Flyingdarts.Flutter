import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/presentation/pages/keyboard_button.dart';

class KeyboardPage extends StatelessWidget {
  KeyboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 13,
        left: 10,
        right: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
                        input: "CLEAR", onPressed: () => {debugPrint("CLEAR")}),
                    KeyboardButton(
                        input: "", onPressed: () => {debugPrint("")}),
                    KeyboardButton(
                        input: "CHECK", onPressed: () => {debugPrint("CHECK")}),
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
          ]),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KeyboardButton(
                      input: "NOSCORE",
                      onPressed: () => {debugPrint("NOSCORE")}),
                  KeyboardButton(
                      input: "0", onPressed: () => {debugPrint("0")}),
                  KeyboardButton(
                      input: "OK", onPressed: () => {debugPrint("OK")}),
                ],
              ),
            ],
          ),
          // Flexible(child: _buildTop(["NOSCORE", "0", "OK"])),
        ],
      ),
    );
  }

  Widget _buildCenterFrom2d(List<List<int>> keyNumbers) {
    List<Row> rows = [];
    for (var row in keyNumbers) {
      List<KeyboardButton> buttons = [];
      for (var key in row) {
        buttons.add(
          KeyboardButton(
            input: key.toString(),
            onPressed: () => debugPrint(key.toString()),
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
