import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String route;
  bool isHovering;
  Color textColor;
  Color onHoverColor;
  double textSize;
  Color indicationColor;

  MenuItem({
    required this.title,
    required this.route,
    this.isHovering = false,
    this.textColor = Colors.black,
    this.onHoverColor = Colors.black,
    this.textSize = 20,
    this.indicationColor = Colors.black,
  });
}
