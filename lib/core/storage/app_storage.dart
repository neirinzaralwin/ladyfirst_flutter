import 'package:flutter/foundation.dart';
import 'package:lady_first_flutter/core/configs/shared_pref_singleton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  //Keys
  static const String _token = "token";
  static const String _refreshToken = "refreshToken";
  static const String _seenLanguageScreen = "seenLanguageScreen";
  static const String _fcmToken = "fcmToken";
  static SharedPreferences instance = SharedPreferencesSingleton.instance!;

  static void setSeenLanguageScreen(bool value) =>
      instance.setBool(_seenLanguageScreen, value);
  static bool get getSeenLanguageScreen =>
      instance.getBool(_seenLanguageScreen) ?? false;

  static Future<bool> setToken(String token) async =>
      await instance.setString(_token, token);
  static String get getToken => instance.getString(_token) ?? "";

  static Future<bool> setRefreshToken(String token) async =>
      await instance.setString(_refreshToken, token);
  static String get getRefreshToken => instance.getString(_refreshToken) ?? "";

  static Future<bool> setFCMToken(String token) async =>
      await instance.setString(_fcmToken, token);
  static String get getFCMToken => instance.getString(_fcmToken) ?? "";

  // user
  static const String _providerUserId = "providerUserId";
  static const String _userId = "userId";
  static const String _userEmail = "userEmail";

  static Future<bool> setUserId(int userId) async =>
      await instance.setInt(_userId, userId);
  static int get getUserId => instance.getInt(_userId) ?? 0;

  static Future<bool> setProviderUserId(String providerUserId) async =>
      await instance.setString(_providerUserId, providerUserId);
  static String get getProviderUserId =>
      instance.getString(_providerUserId) ?? "";

  static Future<bool> setUserEmail(String email) async =>
      await instance.setString(_userEmail, email);
  static String get getUserEmail => instance.getString(_userEmail) ?? "";

  static Future<void> clearUserData() async {
    await Future.wait([
      setProviderUserId(""),
      setUserId(0),
      setUserEmail(""),
      setToken(""),
      setRefreshToken(""),
      setFCMToken(""),
    ]);
    debugPrint("Cleared user data from app storage");
  }
}
