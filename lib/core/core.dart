import 'package:app/core/analytics/app_analytics.dart';
import 'package:app/core/config/app_config.dart';
import 'package:app/core/database/app_database.dart';
import 'package:app/core/infrastructure/firebase_options.dart';

class AppCore {
  static DefaultFirebaseOptions get firebase => DefaultFirebaseOptions();
  static AppAnalytics get analytics => AppAnalytics();
  static AppConfig get config => AppConfig();
  static AppDatabase get database => AppDatabase();
}
