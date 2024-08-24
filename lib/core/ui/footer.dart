import 'package:app/core/core.dart';
import 'package:app/core/utils/app_utils.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final bool isMobile;
  final Color? backgroundColor;
  final Color? textColor;
  const Footer({
    Key? key,
    this.isMobile = true,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = isMobile ? 120.0 : 180.0;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height * 0.6,
            color: backgroundColor ?? AppCore.infra.colors.yellow,
            child: Center(
              child: TextButton(
              onPressed: () => AppUtils.openUrl("https://www.instagram.com/jufembrasil"),
              child:Text(
                "@jufembrasil",
                style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              )),
            ),
          ),
          Container(
            height: height * 0.4,
            color: AppCore.infra.colors.grey,
            child: Center(
                child: Text(
              'Desenvolvido por Lucas Cruz',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: textColor ?? Colors.white),
            )),
          ),
        ],
      ),
    );
  }
}
