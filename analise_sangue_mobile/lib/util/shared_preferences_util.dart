import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  Future<void> save(String atributo, String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(atributo, token);
  }

  Future<String?> get(String atributo) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(atributo);
  }

  Future<void> deleteToken(String atributo) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(atributo);
  }
}
