import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  final Color backgroundColor;
  final String? backgroundImage;
  final Widget appBar;
  final double appBarHeight;
  final Widget drawer;
  final Widget header;
  final Widget body;
  final EdgeInsets bodyPadding;
  final Widget footer;

  const MobileLayout({
    Key? key,
    required this.backgroundColor,
    this.backgroundImage,
    required this.appBar,
    this.appBarHeight = 55,
    required this.drawer,
    required this.header,
    required this.body,
    this.bodyPadding = const EdgeInsets.all(0),
    required this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, appBarHeight),
          child: appBar,
        ),
        drawer: drawer,
        body: Container(
            decoration: backgroundImage != null ? BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(backgroundImage!),
                  fit: BoxFit.cover),
            ) : null,
            child: ListView(
              children: [
                header,
                Container(
                  padding: bodyPadding,
                  constraints: const BoxConstraints(minHeight: 400),
                  child: body,
                ),
                footer
              ],
            )));
  }
}
