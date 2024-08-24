import 'package:flutter/material.dart';

import 'package:app/core/layout/responsive_layout.dart';

class Header extends StatelessWidget {
  final ImageProvider backgroundImage;
  final Color backgroundGradientColor;
  double height;
  bool shadowImage;
  double opacity;
  String? title;
  TextStyle? titleTextStyle;

  Header({
    Key? key,
    required this.backgroundImage,
    required this.backgroundGradientColor,
    this.height = 120.0,
    this.shadowImage = false,
    this.opacity = 0.5,
    this.title,
    this.titleTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: backgroundImage,
                fit: BoxFit.fill,
                colorFilter: shadowImage
                    ? ColorFilter.mode(
                        backgroundGradientColor.withOpacity(opacity),
                        BlendMode.darken)
                    : null,
              ),
            )),
        shadowImage
            ? Positioned(
                top: 0,
                child: Container(
                  width: screenSize.width,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [backgroundGradientColor, Colors.transparent],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                ))
            : Container(),
        shadowImage
            ? Positioned(
                bottom: 0,
                child: Container(
                  width: screenSize.width,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.transparent, backgroundGradientColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                ))
            : Container(),
        buildHeaderText()
      ],
    );
  }

  Widget buildHeaderText() {
    if (title != null) {
      return Center(
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: titleTextStyle,
        ),
      );
    } else {
      return Container();
    }
  }
}
