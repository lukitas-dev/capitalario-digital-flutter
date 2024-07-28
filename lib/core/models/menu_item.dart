import 'package:app/core/infrastructure/app_colors.dart';
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
    this.textColor = AppColors.browLight,
    this.onHoverColor = AppColors.white,
    this.textSize = 20,
    this.indicationColor = AppColors.white,
  });
}
