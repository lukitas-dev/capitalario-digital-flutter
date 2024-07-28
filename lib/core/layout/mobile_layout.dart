import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  final Color backgroundColor;
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
    required this.appBar,
    this.appBarHeight = 65,
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
