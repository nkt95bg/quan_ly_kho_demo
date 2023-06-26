import 'package:flutter/material.dart';

import '../../core/utils/common/app_colors.dart';

class ButtonText extends StatelessWidget {
  final VoidCallback voidCallback;
  final String title;
  final TextStyle? textStyle;

  const ButtonText(
      {Key? key,
      required this.voidCallback,
      required this.title,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Text(
        title,
        style: textStyle ??
            Theme.of(context).textTheme.subtitle1!.copyWith(
                color: AppColors.primary, fontWeight: FontWeight.w400),
      ),
    );
  }
}
