import 'dart:developer';

import 'package:app/core/infrastructure/app_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AppAnalytics {
  trackScreen(AppScreen screen) async {
    log("Track screen -> ${screen.screenName} on ${screen.className}");
    await FirebaseAnalytics.instance.logScreenView(
      screenClass: screen.className,
      screenName: screen.screenName,
    );
  }
}
