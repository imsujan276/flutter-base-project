import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  SharedPref._privateConstructor();
  static final SharedPref instance = SharedPref._privateConstructor();

  /// read from storage
  Future<String> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(key);
    return data ?? "";
  }

  /// save to storage
  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(value));
  }

  /// read from storage
  readBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  /// save to storage
  saveBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  /// remove key from storage
  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  /// clear storage
  clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
