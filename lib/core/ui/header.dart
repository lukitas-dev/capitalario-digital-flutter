import 'package:app/core/layout/responsive_layout.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final ImageProvider backgroundImage;
  final Color backgroundGradientColor;
  String? title;
  TextStyle? titleTextStyle;

  Header({
    Key? key,
    required this.backgroundImage,
    required this.backgroundGradientColor,
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
            height: ResponsiveLayout.isMobileScreen(context) ? 320.0 : 480,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: backgroundImage,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    backgroundGradientColor.withOpacity(0.5), BlendMode.darken),
              ),
            )),
        Positioned(
            top: 0,
            child: Container(
              width: screenSize.width,
              height: 120,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [backgroundGradientColor, Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            )),
        Positioned(
            bottom: 0,
            child: Container(
              width: screenSize.width,
              height: 120,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, backgroundGradientColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            )),
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
