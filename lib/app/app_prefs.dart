import 'package:shared_preferences/shared_preferences.dart';

class AppPrferences {
 final SharedPreferences? _sharedPreferences;
  AppPrferences(this._sharedPreferences);

  Future<String >getAppLanguage() async {
    String language = _sharedPreferences!.getString("language") ?? "en";
    return language;
  }
}
