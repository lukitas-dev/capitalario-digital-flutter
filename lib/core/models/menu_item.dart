import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String routePath;
  bool isHovering;
  Color textColor;
  Color onHoverColor;
  double textSize;
  Color indicationColor;

  MenuItem({
    required this.title,
    required this.routePath,
    this.isHovering = false,
    this.textColor = const Color(0xffDEB077),
    this.onHoverColor = Colors.white,
    this.textSize = 20,
    this.indicationColor = Colors.white,
  });
}
