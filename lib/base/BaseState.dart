import 'package:flutter/cupertino.dart';
import 'package:flutterpixiv/Common.dart';
import 'package:flutterpixiv/models/UserModel.dart';
import 'package:flutterpixiv/tools/Cache.dart';

abstract class StateWithUser<T extends StatefulWidget> extends State<T>{

  UserModel userModel;

  StateWithUser(){
    Future<UserModel> temp = Cache.getUser();
    temp.then((value) {
      if(value != null) {
        Common.log("获取 本地用户 成功");
        userModel = value;
        userPrepare();
      } else {
        Common.log("获取 本地用户 失败");
      }
    });
  }

  void userPrepare(){
  }
}