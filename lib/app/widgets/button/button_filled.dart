import 'package:flutter/material.dart';

class ButtonFill extends StatelessWidget {
  final VoidCallback? voidCallback;
  final String title;
  final ButtonStyle? buttonStyle;

  const ButtonFill(
      {Key? key,
      required this.voidCallback,
      required this.title,
      this.buttonStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: voidCallback,
      style: buttonStyle ,
      child: Text(title),
    );
  }
}
