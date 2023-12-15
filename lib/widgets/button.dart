import 'package:app_food_new/utils/extensions/button_type.dart';
import 'package:flutter/material.dart';

enum ButtonType { OUTLINE, FILL }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color,
    this.padding,
    required this.title,
    required this.onPressed,
    required this.buttonType,
  });
  final String title;
  final Color? color;
  final Function() onPressed;
  final ButtonType buttonType;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    var defaultPadding =
        const EdgeInsets.symmetric(horizontal: 8, vertical: 12);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding ?? defaultPadding,
        decoration: BoxDecoration(
          border: Border.all(
              color: buttonType.getBorderColor(color ?? Colors.black)),
          color: buttonType.getBackgroundColor(color ?? Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: buttonType == ButtonType.FILL ? Colors.white : color),
          ),
        ),
      ),
    );
  }
}
