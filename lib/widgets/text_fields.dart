import 'package:app_food_new/utils/extensions/border_type.dart';
import 'package:flutter/material.dart';

enum BorderType { OUTLINE, UNDER, NONE }

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.obs,
    this.onChanged,
    this.validate,
    this.hintText,
    this.controller,
    this.borderColor,
    this.sufWidget,
    this.prefWidget,
    required this.borderType,
  });

  final bool? obs;
  final String? hintText;
  final Color? borderColor;
  final Widget? prefWidget;
  final Widget? sufWidget;
  final BorderType borderType;
  final Function(String)? onChanged;
  final String? Function(String?)? validate;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obs ?? false,
      controller: controller,
      validator: validate,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        hintStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
        hintText: hintText,
        prefixIcon: prefWidget,
        suffixIcon: sufWidget,
        contentPadding: const EdgeInsets.all(10),
        border: borderType.getBorer(color: borderColor),
      ),
    );
  }
}
