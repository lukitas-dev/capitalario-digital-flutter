import 'package:flutter/material.dart';

class MenuItem {
  final Widget icon;
  final String title;
  final String routePath;
  bool isHovering;

  MenuItem({
    this.icon = const Icon(Icons.home),
    required this.title,
    required this.routePath,
    this.isHovering = false,
  });
}
