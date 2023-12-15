import 'package:app_food_new/widgets/button.dart';
import 'package:flutter/material.dart';

extension ButtonTypeEx on ButtonType {
  Color getBackgroundColor(Color color) {
    switch (this) {
      case ButtonType.FILL:
        return color;
      case ButtonType.OUTLINE:
        return Colors.white;
    }
  }

  Color getBorderColor(Color color) {
    switch (this) {
      case ButtonType.FILL:
        return Colors.white;
      case ButtonType.OUTLINE:
        return color;
    }
  }
}
