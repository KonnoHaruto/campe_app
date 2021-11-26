import 'package:flutter/material.dart';

class TextButtonStyle extends StatelessWidget {
  const TextButtonStyle({
    Key? key,
    required this.buttonText,
    required this.onPressed
  }) : super(key: key);

  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(buttonText),
      onPressed: () {
        onPressed;
      },
    );
  }
}
