import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutterpixiv/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Cache.dart';
import 'BaseState.dart';

abstract class StatefulWidgetWithUser extends StatefulWidget{

  UserModel userModel;
  StateWithUser stateWithUser;

  StatefulWidgetWithUser(){
    print("time StatefulWidgetWithUser 构造函数");
    getUser();
    print("time StatefulWidgetWithUser 构造函数结束");
  }

  getUser() async {
    print("time StatefulWidgetWithUser 开始获取本地数据");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userJson = pref.getString(Cache.user);
    Map<String, dynamic> map = json.decode(userJson);
    userModel = UserModel.fromJson(map);
    print("time StatefulWidgetWithUser 获取本地数据结束");
    setUser(userModel);
  }

  setUser(UserModel user){
    print("time StatefulWidgetWithUser 更新user");
    stateWithUser.updateUser(user);
  }

  @override
  State<StatefulWidget> createState() {
    stateWithUser = create();
    return stateWithUser;
  }

  State<StatefulWidget> create();
}