import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget {
  final String title;
  TextStyle? titleStyle;
  final Color backgroundColor;
  List<Widget>? actions;
  VoidCallback? onBackCallback;
  Color onBackColor;
  bool hasBack;

  Toolbar({
    Key? key,
    required this.title,
    this.titleStyle = const TextStyle(color: Colors.white, fontSize: 24),
    required this.backgroundColor,
    this.actions,
    this.onBackCallback,
    this.onBackColor = Colors.white,
    this.hasBack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: onBackColor),
      centerTitle: true,
      leading: hasBack
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: onBackColor,
              ),
              onPressed: onBackCallback,
            )
          : null,
      title:
          FittedBox(fit: BoxFit.contain, child: Text(title, style: titleStyle)),
      actions: actions ?? [],
      backgroundColor: backgroundColor,
    );
  }
}
