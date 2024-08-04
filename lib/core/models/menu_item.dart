import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String routePath;
  bool isHovering;


  MenuItem({
    required this.title,
    required this.routePath,
    this.isHovering = false,
  });
}
