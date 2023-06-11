// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedPreferencesService> getInstance() async {
    // ignore: prefer_conditional_assignment
    if (_preferences == null) {
       _instance = SharedPreferencesService();
      await _instance!._initPreferences();
    }
    return _instance!;
  }

  Future<void> _initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> setBool(String key, bool value) async {
    return _preferences?.setBool(key, value) ?? Future.value(false);
  }

  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

 Future<bool> remove(String key) async {
    return _preferences?.remove(key) ?? Future.value(false);
  }

}
