import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/core/ui/header.dart';
import 'package:app/pray/models/pray_info.dart';
import 'package:app/pray/stores/pray_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrayController {
  PrayStore store = PrayStore();
  late PrayInfo info;

  setup() {
    store.setup((homeInfo) {
      info = homeInfo;
    });
  }

  Widget buildHeader() {
    if (info.headerImagePath.isNotEmpty) {
      return Header(
          backgroundImage: AssetImage(info.headerImagePath),
          backgroundGradientColor: Colors.black,
          title: info.title,
          titleTextStyle: GoogleFonts.rosario(fontWeight: FontWeight.bold));
    }
    return Container();
  }

  Widget buildTitle() {
    if (info.title.isNotEmpty) {
      return Text(
        info.title,
        textAlign: TextAlign.center,
        style: GoogleFonts.rosario(fontSize: 24, fontWeight: FontWeight.bold),
      );
    }
    return Container();
  }

  Widget buildText() {
    if (info.text.isNotEmpty) {
      return Text(
        info.text,
        textAlign: TextAlign.center,
        style: GoogleFonts.rosario(fontSize: 20),
      );
    }
    return Container();
  }

  AppState getState() {
    return store.state;
  }
}
