import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final VoidCallback voidCallback;

  const MyFilledButton({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    required this.voidCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundColor,
              border: Border.all(
                  color: borderColor ?? const Color.fromARGB(0, 0, 0, 0))),
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            (title).toUpperCase(),
            style: TextStyle(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
