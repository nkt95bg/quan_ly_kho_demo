import 'package:flutter/material.dart';

import '../../core/utils/common/app_colors.dart';
import '../../core/utils/common/app_text_styles.dart';

class AppDropDownWidget<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final String? hintText;
  final ValueChanged<T?>? onChanged;
  final String? label;
  final TextStyle? labelStyle;
  final Color? filledColor;
  final bool? filled;
  final Color? iconColor;
  final bool? required;
  final bool outline;

  const AppDropDownWidget(
      {Key? key,
      required this.items,
      this.value,
      this.hintText,
      this.onChanged,
      this.label,
      this.labelStyle,
      this.filledColor,
      this.filled,
      this.iconColor,
      this.outline = false,
      this.required = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: label != null,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label ?? "",
                    style: labelStyle ?? AppTextStyle.H3,
                  ),
                  Visibility(
                    visible: required!,
                    child: Text(
                      "*",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.red,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
              isDense: true,
              value: value,
              isExpanded: true,
              onChanged: onChanged,
              decoration: InputDecoration(
                border: outline ? const OutlineInputBorder() : null,
                filled: filled,
                fillColor: filledColor,
                isDense: true,
                hintText: hintText,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
              items: items,
            ),
          ),
        ),
      ],
    );
  }
}
