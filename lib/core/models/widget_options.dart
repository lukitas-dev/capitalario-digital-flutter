import 'package:flutter/material.dart';

class WidgetOptions {
  final double width;
  final double height;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double borderWidth;
  final double borderRadius;
  final double textFontSize;

  WidgetOptions(
      {this.width = 400.0,
      this.height = 100.0,
      required this.borderColor,
      required this.backgroundColor,
      required this.textColor,
      this.margin =
          const EdgeInsets.only(left: 15.0, top: 5.0, right: 15.0, bottom: 0.0),
      this.padding = const EdgeInsets.all(15),
      this.borderWidth = 2,
      this.borderRadius = 10,
      this.textFontSize = 18});
}
