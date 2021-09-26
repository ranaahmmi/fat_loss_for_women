import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class ConsumableStore {
  static const String _storekeyname = 'fitnessApp';
  static Future<void> _writesmethoad = Future.value();

  static Future<void> save(String? id) {
    _writesmethoad = _writesmethoad.then((void _) => _doSave(id));
    return _writesmethoad;
  }

  static Future<void> consume(String? id) {
    _writesmethoad = _writesmethoad.then((void _) => _doConsume(id));
    return _writesmethoad;
  }

  static Future<List<String?>> load() async {
    return (await SharedPreferences.getInstance())
            .getStringList(_storekeyname) ??
        [];
  }

  static Future<void> _doSave(String? id) async {
    List<String?> cached = await load();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cached.add(id);
    await prefs.setStringList(_storekeyname, cached as List<String>);
  }

  static Future<void> _doConsume(String? id) async {
    List<String?> cached = await load();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cached.remove(id);
    await prefs.setStringList(_storekeyname, cached as List<String>);
  }
}
