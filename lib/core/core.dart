import 'package:app/core/analytics/app_analytics.dart';
import 'package:app/core/config/app_config.dart';
import 'package:app/core/constants/app_constants.dart';
import 'package:app/core/database/app_database.dart';

import 'package:app/core/infrastructure/firebase_options.dart';
import 'package:app/core/infrastructure/insfrasctructure.dart';
import 'package:firebase_core/firebase_core.dart';

class AppCore {
  static DefaultFirebaseOptions get firebase => DefaultFirebaseOptions();
  static AppAnalytics get analytics => AppAnalytics();
  static AppConfig get config => AppConfig();
  static AppConstants get constants => AppConstants();
  static AppDatabase get database => AppDatabase();
  static AppInfrastructure get infra => AppInfrastructure();

  static startup() async {
    await Firebase.initializeApp(
      options: firebase.options,
    );
    await AppCore.config.setupAndFetch();
  }
}