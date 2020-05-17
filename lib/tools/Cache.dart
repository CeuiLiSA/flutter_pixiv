
import 'dart:convert';

import 'package:flutterpixiv/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cache{

  static final String user = "ceui.lisa.pixiv.user";
  static final String test = "ceui.lisa.pixiv.test";


  static Future<UserModel> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userJson = pref.getString(Cache.user);
    Map<String, dynamic> map = json.decode(userJson);
    UserModel userModel = UserModel.fromJson(map);
    return userModel;
  }

//  static void putString(String k, String v) async {
//    SpUtil sp = await SpUtil.getInstance();
//    sp.putString(k, v);
//  }
//
//  static Future<String> getString(String key) async {
//    SpUtil sp = await SpUtil.getInstance();
//    sp.get(key);
//  }
}