import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  final Color backgroundColor;
  final Widget navbar;
  final double navBarHeight;
  final Widget header;
  final Widget body;
  final Widget footer;
  const DesktopLayout({
    Key? key,
    required this.backgroundColor,
    required this.navbar,
    this.navBarHeight = 85,
    required this.header,
    required this.body,
    required this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, navBarHeight),
          child: navbar,
        ),
        body: ListView(
          children: [
            header,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 800,
                  constraints: const BoxConstraints(minHeight: 800),
                  child: body,
                )
              ],
            ),
            footer
          ],
        ));
  }
}
