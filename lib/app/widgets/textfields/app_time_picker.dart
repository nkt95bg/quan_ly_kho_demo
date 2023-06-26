import 'package:flutter/material.dart';

import '../../core/utils/common/app_colors.dart';
import 'app_text_field.dart';

class AppTimePickerWidget extends StatefulWidget {
  final ValueChanged<TimeOfDay>? onChanged;
  final String? label;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final EdgeInsets? padding;
  final TextStyle? labelStyle;
  final bool readOnly;
  final bool required;
  final TextStyle? textStyle;
  final TimeOfDay? initTime;
  final InputBorder? border;
  final TextAlign? textAlign;
  const AppTimePickerWidget({
    Key? key,
    this.onChanged,
    this.label,
    this.hintText,
    this.validator,
    this.padding,
    this.labelStyle,
    this.readOnly = false,
    required this.required,
    this.textStyle,
    this.initTime,
    this.border,
    this.textAlign,
  }) : super(key: key);

  @override
  State<AppTimePickerWidget> createState() => _AppTimePickerWidgetState();
}

class _AppTimePickerWidgetState extends State<AppTimePickerWidget> {
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController timeText = TextEditingController();

  @override
  void initState() {
    selectedTime = widget.initTime ?? TimeOfDay.now();
    timeText.text = timeString;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFieldWidget(
      inputController: timeText,
      onTap: () {
        showTimePicker(
          context: context,
          initialTime: selectedTime,
        ).then((value) {
          if (value == null) return;
          selectedTime = value;
          timeText.text = timeString;
          widget.onChanged?.call(value);
        });
      },
      label: widget.label,
      textAlign: widget.textAlign,
      border: widget.border,
      validator: widget.validator,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Icon(
          Icons.schedule_outlined,
          color: AppColors.secondary.withOpacity(0.8),
        ),
      ),
    );
  }

  String get timeString {
    String hour = selectedTime.hour.toString();
    if (hour.length < 2) {
      hour = '0' + hour;
    }
    String minute = selectedTime.minute.toString();
    if (minute.length < 2) {
      minute = '0' + minute;
    }
    return '${hour}:${minute}';
  }
}
