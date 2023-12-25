// ignore_for_file: always_declare_return_types

import 'package:shared_preferences/shared_preferences.dart';

class CashedHelper {
  static SharedPreferences? _sharedPreferences;

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setUserToken(value) async {
    return await _sharedPreferences!.setString('access_token', value);
  }

  static String getUserToken() {
    return _sharedPreferences!.getString('access_token') ?? '';
  }

  static Future<bool> setUserType(value) async {
    return await _sharedPreferences!.setString('type', value);
  }

  static String getUserType() {
    return _sharedPreferences!.getString('type') ?? '';
  }

  static Future<bool> setLogin(value) async {
    return await _sharedPreferences!.setBool('login', value);
  }

  static Future<bool> setProductList(value) async {
    return await _sharedPreferences!.setStringList('Id', value);
  }

  static bool getLogin() {
    return _sharedPreferences!.getBool('login') ?? false;
  }

  static Future<bool> setFCMToken(value) async {
    return await _sharedPreferences!.setString('fcm_token', value);
  }

  static String getFCMToken() {
    return _sharedPreferences!.getString('fcm_token') ?? '';
  }

  static Future<bool> setPhone(value) async {
    return await _sharedPreferences!.setString('phone', value);
  }

  static String getPhone() {
    return _sharedPreferences!.getString('phone') ?? '';
  }

  static Future<bool> setParentID(value) async {
    return await _sharedPreferences!.setString('parentID', value);
  }

  static String getParentID() {
    return _sharedPreferences!.getString('parentID') ?? '';
  }

  static Future<bool> setEmail(value) async {
    return await _sharedPreferences!.setString('email', value);
  }

  static String getEmail() {
    return _sharedPreferences!.getString('email') ?? '';
  }

  static Future<bool> setChildId(value) async {
    return await _sharedPreferences!.setString('child', value);
  }

  static String getChildId() {
    return _sharedPreferences!.getString('child') ?? '';
  }

  static Future<bool> setRole(value) async {
    return await _sharedPreferences!.setString('role', value);
  }

  static String getRole() {
    return _sharedPreferences!.getString('role') ?? '';
  }

  static Future<bool> setBirth(value) async {
    return await _sharedPreferences!.setString('birth', value);
  }

  static String getBirth() {
    return _sharedPreferences!.getString('birth') ?? '';
  }

  static Future<bool> setUserId(value) async {
    return await _sharedPreferences!.setString('id', value);
  }

  static String getUserId() {
    return _sharedPreferences!.getString('id') ?? '';
  }

  static Future<bool> setAddress(value) async {
    return await _sharedPreferences!.setString('address', value);
  }

  static String getAddress() {
    return _sharedPreferences!.getString('address') ?? '';
  }

  static Future<bool> setNotification(value) async {
    return await _sharedPreferences!.setBool('notifications', value);
  }

  static bool getNotification() {
    return _sharedPreferences!.getBool('notifications') ?? false;
  }

  static Future<bool> setLang(value) async {
    return await _sharedPreferences!.setString('lang', value);
  }

  static String getLang() {
    return _sharedPreferences!.getString('lang') ?? '';
  }

  static Future<bool> setUserImage(value) async {
    return await _sharedPreferences!.setString('image', value);
  }

  static String getUserImage() {
    return _sharedPreferences!.getString('image') ?? '';
  }

  static Future<bool> setUserName(value) async {
    return await _sharedPreferences!.setString('user_name', value);
  }

  static String getUserName() {
    return _sharedPreferences!.getString('user_name') ?? '';
  }
}
