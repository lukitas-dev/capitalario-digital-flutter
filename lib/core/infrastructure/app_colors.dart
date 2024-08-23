import 'package:flutter/material.dart';

class AppColors {
  Color get background => white;
  Color get toolbarBackground => blue;
  Color get primary => blueLight;
  Color get primaryDark => blue;
  Color get accent => yellow;

  //Paleta
  Color get blue => const Color(0xff1F2549);
  Color get blueLight => const Color(0xff9ba7bf);
  Color get grey => const Color(0xff323232);
  Color get greyLight => const Color(0xffd9d9d9);
  Color get brow => const Color(0xff3e2b16);
  Color get browLight => const Color(0xffDEB077);
  Color get yellow => const Color(0xffDA9C3B);
  Color get red => const Color(0xffF21D1D);
  Color get white => const Color(0xffD9D6C7);
  Color get black => const Color(0xff262626);

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
