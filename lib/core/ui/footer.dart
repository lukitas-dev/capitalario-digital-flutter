import 'dart:developer';

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
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: isMobile ? 180 : 250,
      color: backgroundColor ?? Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Developed by Lucas Cruz',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor ?? Colors.amber),
          ),
          TextButton(
              onPressed: () => log("onClick"),
              child: Text(
                'Reportar Problema',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: textColor ?? Colors.amber),
              )),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
