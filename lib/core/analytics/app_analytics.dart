import 'package:app/core/models/app_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AppAnalytics {
  static trackScreen(AppScreen screen) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': screen.screenName,
        'firebase_screen_class': screen.className,
      },
    );
  }
}
