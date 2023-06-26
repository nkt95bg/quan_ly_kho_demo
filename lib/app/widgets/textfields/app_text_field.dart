import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import '../../core/utils/common/app_colors.dart';
import '../../core/utils/common/app_text_styles.dart';

class AppTextFieldWidget extends StatefulWidget {
  final TextEditingController? inputController;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final String? label;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final bool obscureText;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final bool? filled;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool required;
  final Widget? leftLabel;
  final TextStyle? textStyle;
  final String? initText;
  final InputBorder? border;
  final TextAlign? textAlign;
  final bool? enabled;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextFieldWidget(
      {Key? key,
      this.inputController,
      this.onChanged,
      this.textInputType,
      this.label,
      this.hintText,
      this.validator,
      this.obscureText = false,
      this.onFieldSubmitted,
      this.focusNode,
      this.padding,
      this.filled,
      this.fillColor,
      this.prefixIcon,
      this.labelStyle,
      this.readOnly = false,
      this.onTap,
      this.required = false,
      this.leftLabel,
      this.textStyle,
      this.border,
      this.initText,
      this.textAlign,
      this.inputFormatters,
      this.suffixIcon,
      this.enabled,
      this.maxLines})
      : super(key: key);

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  late bool _obscureText;
  late TextEditingController inputController;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    inputController =
        widget.inputController ?? TextEditingController(text: widget.initText);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppTextFieldWidget oldWidget) {
    if (widget.initText != oldWidget.initText) {
      inputController.text = widget.initText ?? inputController.text;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: widget.label != null,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.label ?? "",
                    style: widget.labelStyle ?? AppTextStyle.H3,
                  ),
                  Visibility(
                    visible: widget.required,
                    child: Text(
                      "*",
                      style: (widget.labelStyle ?? AppTextStyle.Paragraph14)
                          .copyWith(color: AppColors.red),
                    ),
                  ),
                  const Spacer(),
                  widget.leftLabel ?? const SizedBox()
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            focusNode: widget.focusNode,
            controller: inputController,
            obscureText: _obscureText,
            onFieldSubmitted: widget.onFieldSubmitted,
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            style: widget.textStyle,
            textAlign: widget.textAlign ?? TextAlign.start,
            inputFormatters: widget.inputFormatters,
            maxLines: widget.maxLines ?? 1,
            enabled: widget.enabled,
            decoration: InputDecoration(
                filled: widget.filled,
                border: widget.border,
                fillColor: widget.fillColor,
                hintText: widget.hintText,
                contentPadding: widget.padding ??
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                suffixIconConstraints: const BoxConstraints(maxHeight: 24),
                prefixIconConstraints: const BoxConstraints(maxHeight: 24),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.obscureText
                    ? GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(_obscureText
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye),
                        ),
                      )
                    : widget.suffixIcon),
            keyboardType: widget.textInputType,
            onChanged: widget.onChanged,
            validator: widget.validator,
          ),
        ),
      ],
    );
  }
}
