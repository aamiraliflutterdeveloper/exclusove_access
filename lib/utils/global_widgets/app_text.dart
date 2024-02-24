import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MultiText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final TextStyle style1;
  final TextStyle style2;
  final GestureRecognizer recognizer;
  const MultiText({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.style1,
    required this.style2,
    required this.recognizer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: style1,
          ),
          TextSpan(
            text: secondText,
            style: style2,
            recognizer: recognizer,
          ),
        ],
      ),
    );
  }
}