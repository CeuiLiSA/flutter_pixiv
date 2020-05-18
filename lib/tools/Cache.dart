
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutterpixiv/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cache{

  static final String user = "ceui.lisa.pixiv.user";
  static final String test = "ceui.lisa.pixiv.test";


  static Future<UserModel> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userJson = pref.getString(Cache.user);
    if(userJson != null && userJson.length > 0) {
      debugPrint(userJson);
      Map<String, dynamic> map = json.decode(userJson);
      UserModel userModel = UserModel.fromJson(map);
      return userModel;
    }
    return null;
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