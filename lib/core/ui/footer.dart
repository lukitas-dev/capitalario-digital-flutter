import 'dart:developer';

import 'package:app/core/infrastructure/app_colors.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final bool isMobile;
  const Footer({
    Key? key,
    this.isMobile = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: isMobile ? 180 : 250,
      color: AppColors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Developed by Lucas Cruz',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.browLight),
          ),
          TextButton(
              onPressed: () => log("onClick"),
              child: const Text(
                'Reportar Problema',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.red),
              )),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
