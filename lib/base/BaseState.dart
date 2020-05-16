import 'package:flutter/cupertino.dart';
import 'package:flutterpixiv/models/UserModel.dart';

abstract class StateWithUser<T extends StatefulWidget> extends State<T>{

  UserModel userModel;

  StateWithUser(){
    print("time StateWithUser 构造函数");
  }

  updateUser(UserModel user){
    print("time StateWithUser 更新用户");
    userModel = user;
    userPrepare();
  }

  void userPrepare(){
    print("time StateWithUser userPrepare");
  }
}