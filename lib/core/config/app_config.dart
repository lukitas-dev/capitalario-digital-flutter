import 'package:app/core/core.dart';
import 'package:app/given/constants/given_constants.dart';
import 'package:app/home/constants/home_constants.dart';
import 'package:app/light/constants/light_constants.dart';
import 'package:app/pray/constants/pray_constants.dart';
import 'package:app/viewer/constants/viewer_constants.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class AppConfig {
  final _constants = AppCore.constants.config;

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
    defaultValues[_constants.homeInfo] = HomeConstants.infoDefaults;
    defaultValues[_constants.lightInfo] = LightConstants.infoDefaults;
    defaultValues[_constants.prayInfo] = PrayConstants.infoDefaults;
    defaultValues[_constants.givenInfo] = GivenConstants.infoDefaults;
    defaultValues[_constants.viewerInfo] = ViewerConstants.infoDefaults;
    defaultValues[_constants.settingsInfo] = _constants.settingsDefaults;
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
