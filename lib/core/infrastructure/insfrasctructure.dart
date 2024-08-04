import 'package:app/core/infrastructure/app_colors.dart';
import 'package:app/core/infrastructure/app_dimensions.dart';
import 'package:app/core/infrastructure/app_menu.dart';
import 'package:app/core/infrastructure/firebase_options.dart';

class AppInfrastructure {
  AppColors get colors => AppColors();
  AppMenu get menu => AppMenu();
  AppDimensions get dimens => AppDimensions();
  DefaultFirebaseOptions get firebase => DefaultFirebaseOptions();
}
