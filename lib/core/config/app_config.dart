import 'package:app/core/constants/constants.dart';
import 'package:app/home/constants/home_constants.dart';
import 'package:app/pray/constants/pray_constants.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class AppConfig {
  setupAndFetch() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    await remoteConfig.setDefaults(prepareDefaultValues());

    await remoteConfig.fetchAndActivate();
  }

  Map<String, dynamic> prepareDefaultValues() {
    var defaultValues = <String, dynamic>{};
    defaultValues[AppConstants.homeInfoKey] = HomeConstants.infoDefaults;
    defaultValues[AppConstants.prayInfoKey] = PrayConstants.infoDefaults;
    return defaultValues;
  }

  bool getBoolean(String key) {
    return FirebaseRemoteConfig.instance.getBool(key);
  }

  double getDouble(String key) {
    return FirebaseRemoteConfig.instance.getDouble(key);
  }

  int getInt(String key) {
    return FirebaseRemoteConfig.instance.getInt(key);
  }

  String getString(String key) {
    return FirebaseRemoteConfig.instance.getString(key);
  }
}
