import 'package:firebase_remote_config/firebase_remote_config.dart';

class AppConfig {
  static AppConfig? _instance;
  // Avoid self instance
  AppConfig._();
  static AppConfig get instance => _instance ??= AppConfig._();

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
    defaultValues["example_param_1"] = 42;
    defaultValues["example_param_2"] = 3.14159;
    defaultValues["example_param_3"] = true;
    defaultValues["example_param_4"] = "Hello, world!";
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
