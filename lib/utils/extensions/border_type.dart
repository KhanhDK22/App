import 'package:app_food_new/widgets/text_fields.dart';
import 'package:flutter/material.dart';

extension BorderTypeEx on BorderType {
  InputBorder getBorer({Color? color}) {
    switch (this) {
      case BorderType.NONE:
        return InputBorder.none;
      case BorderType.UNDER:
        return UnderlineInputBorder(
          borderSide: BorderSide(width: 0.7, color: color ?? Colors.black),
        );
      case BorderType.OUTLINE:
        return OutlineInputBorder(
          borderSide: BorderSide(width: 0.7, color: color ?? Colors.black),
        );
    }
  }
}
