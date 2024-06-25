import 'dart:convert';

import 'package:animalswale_app/presentation/screens/auth/otp/otp_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/routers/routers_import.gr.dart';

class Utils {

  static Future<void> manipulateLogin(context)async{
    var token = await getToken();
    if(token != null){
      //Home Screen
      AutoRouter.of(context).push(const GeneralRoute());
    }else{
      //Login & Auth Screen & Onboard Screen
      AutoRouter.of(context).push(const AuthRoute());
    }
  }

  static Future<void> set(String key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (value is bool) {
      sharedPreferences.setBool(key, value);
    } else if (value is String) {
      sharedPreferences.setString(key, value);
    } else if (value is double) {
      sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      sharedPreferences.setInt(key, value);
    }else if(value is Object){
      sharedPreferences.setString(key, json.encode(value));
    }
  }

  static Future<dynamic> get(String key, {dynamic defaultValue}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.get(key) ?? defaultValue;
  }

  //HEADER SAVE AUTH TOKEN METHOD
  static Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  //HEADER GET AUTH TOKEN METHOD
  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  //HEADER SAVE AUTH TOKEN METHOD
  static Future<void> saveFCMToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("deviceToken", token);
  }

  //HEADER GET AUTH TOKEN METHOD
  static Future<String?> getFCMToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("deviceToken");
  }

  //USERDATA SAVE METHOD
  static Future<void> saveUSerData(UserData userData) async {
    await set('userData', userData);
    print("USER DATA Set time--=---=-=---=-->${userData.toString()}");
  }

  //HEADER GET AUTH TOKEN METHOD
  static Future<dynamic> getUSerData() async {
    return await get('userData');
  }

  //Clear ALL Shared prefs Data METHOD
  static Future<void> clearAllSavedData()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}