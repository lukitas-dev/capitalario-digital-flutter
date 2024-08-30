import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  final Color backgroundColor;
  final bool hasAppBar;
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
    required this.hasAppBar,
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
        appBar: hasAppBar
            ? PreferredSize(
                preferredSize: Size(screenSize.width, appBarHeight),
                child: appBar,
              )
            : PreferredSize(
                preferredSize: const Size(0.0, 0.0),
                child: Container(),
              ),
        drawer: drawer,
        body: ListView(
          children: [
            header,
            Container(
              padding: bodyPadding,
              constraints: const BoxConstraints(minHeight: 400),
              child: body,
            ),
            footer
          ],
        ));
  }
}
