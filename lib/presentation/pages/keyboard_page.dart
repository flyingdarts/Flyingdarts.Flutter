import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/presentation/pages/keyboard_button.dart';

class KeyboardPage extends StatelessWidget {
  const KeyboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Flex(
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.max,
              children: [
                KeyboardButton(
                  input: "26",
                  onPressed: () => debugPrint("26"),
                ),
                KeyboardButton(
                  input: "1",
                  onPressed: () => debugPrint("1"),
                ),
                KeyboardButton(
                  input: "2",
                  onPressed: () => debugPrint("2"),
                ),
                KeyboardButton(
                  input: "3",
                  onPressed: () => debugPrint("3"),
                ),
                KeyboardButton(
                  input: "40",
                  onPressed: () => debugPrint("40"),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Flex(
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.max,
              children: [
                KeyboardButton(
                  input: "26",
                  onPressed: () => debugPrint("26"),
                ),
                KeyboardButton(
                  input: "1",
                  onPressed: () => debugPrint("1"),
                ),
                KeyboardButton(
                  input: "2",
                  onPressed: () => debugPrint("2"),
                ),
                KeyboardButton(
                  input: "3",
                  onPressed: () => debugPrint("3"),
                ),
                KeyboardButton(
                  input: "40",
                  onPressed: () => debugPrint("40"),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Flex(
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.max,
              children: [
                KeyboardButton(
                  input: "26",
                  onPressed: () => debugPrint("26"),
                ),
                KeyboardButton(
                  input: "1",
                  onPressed: () => debugPrint("1"),
                ),
                KeyboardButton(
                  input: "2",
                  onPressed: () => debugPrint("2"),
                ),
                KeyboardButton(
                  input: "3",
                  onPressed: () => debugPrint("3"),
                ),
                KeyboardButton(
                  input: "40",
                  onPressed: () => debugPrint("40"),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Flex(
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.max,
              children: [
                KeyboardButton(
                  input: "26",
                  onPressed: () => debugPrint("26"),
                ),
                KeyboardButton(
                  input: "1",
                  onPressed: () => debugPrint("1"),
                ),
                KeyboardButton(
                  input: "2",
                  onPressed: () => debugPrint("2"),
                ),
                KeyboardButton(
                  input: "3",
                  onPressed: () => debugPrint("3"),
                ),
                KeyboardButton(
                  input: "40",
                  onPressed: () => debugPrint("40"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
