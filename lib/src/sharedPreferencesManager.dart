import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static final SharedPreferencesManager instance =
      SharedPreferencesManager._internal();

  factory SharedPreferencesManager() {
    return instance;
  }

  SharedPreferences? prefs;

  SharedPreferencesManager._internal();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool get isSwitched => prefs!.getBool('isSwitched') ?? false;

  set isSwitched(bool value) {
    prefs!.setBool('isSwitched', value);
  }
}
