
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterpixiv/http/JsonUtil.dart';
import 'package:flutterpixiv/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../tools/Cache.dart';
import '../main_activity.dart';
import 'PixivHeader.dart';

class Login{

  //用作登录，刷新token
  static String ACCOUNT_BASE_URL = "https://oauth.secure.pixiv.net";


  static final String CLIENT_ID = "MOBrBDS8blbauoSck0ZfDbtuzpyT";
  static final String CLIENT_SECRET = "lsACyCD94FhDUtGTXi3QzcFE2uU1hqtDaKeqrdwj";
  static final String DEVICE_TOKEN = "pixiv";
  static final String GRANT_TYPE = "refresh_token";
  static final String TYPE_PASSWORD = "password";
  static final String SIGN_TOKEN = "Bearer l-f9qZ0ZyqSwRyZs8-MymbtWBbSxmCu1pmbOlyisou8";


  static final String SIGN_REF = "pixiv_android_app_provisional_account";


  login(String name, String pwd, BuildContext context) async {

    PixivHeader header = PixivHeader();
    BaseOptions options = BaseOptions(
      baseUrl: ACCOUNT_BASE_URL,
        responseType: ResponseType.plain,
      headers: {
        "User-Agent": "PixivAndroidApp/5.0.175 (Android 6.0.1; D6653)",
        "Accept-Language": "zh_CN",
        "X-Client-Time": header.XClientTime,
        "X-Client-Hash": header.XClientHash,
      }
    );

    Dio dio = Dio(options);


    FormData formData = FormData.fromMap({
      "client_id": CLIENT_ID,
      "client_secret": CLIENT_SECRET,
      "device_token": DEVICE_TOKEN,
      "get_secure_url": true,
      "grant_type": TYPE_PASSWORD,
      "include_policy": true,
      "password": pwd,
      "username": name,
    });
    var response = await dio.post(ACCOUNT_BASE_URL + "/auth/token", data: formData);
    JsonUtil.printRespond(response);
    String temp = response.data.toString();


    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Cache.user, temp);

    Navigator.push(
      //跳转到第二个界面
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(),
      ),
    );
  }

  Future<String> getNewToken() async{
    PixivHeader header = PixivHeader();
    BaseOptions options = BaseOptions(
        baseUrl: ACCOUNT_BASE_URL,
        responseType: ResponseType.plain,
        headers: {
          "User-Agent": "PixivAndroidApp/5.0.175 (Android 6.0.1; D6653)",
          "Accept-Language": "zh_CN",
          "X-Client-Time": header.XClientTime,
          "X-Client-Hash": header.XClientHash,
        }
    );

    Dio dio = Dio(options);

    //耗时操作，await顺序执行
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userJson = pref.getString(Cache.user);
    Map<String, dynamic> map = json.decode(userJson);
    UserModel userModel = UserModel.fromJson(map);


    FormData formData = FormData.fromMap({
      "client_id": CLIENT_ID,
      "client_secret": CLIENT_SECRET,
      "grant_type": GRANT_TYPE,
      "refresh_token": userModel.response.refreshToken,
      "device_token": userModel.response.deviceToken,
      "get_secure_url": true,
      "include_policy": true,
    });
    //耗时操作，await顺序执行
    var response = await dio.post(ACCOUNT_BASE_URL + "/auth/token", data: formData);
    JsonUtil.printRespond(response);

    String temp = response.data.toString();

    //更新user
    pref.setString(Cache.user, temp);

    Map<String, dynamic> newMap = json.decode(temp);
    UserModel newUser = UserModel.fromJson(newMap);
    return "Bearer " + newUser.response.accessToken;
  }
}
