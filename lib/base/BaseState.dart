import 'package:flutter/cupertino.dart';
import 'package:flutterpixiv/models/UserModel.dart';
import 'package:flutterpixiv/tools/Cache.dart';

abstract class StateWithUser<T extends StatefulWidget> extends State<T>{

  UserModel userModel;

  StateWithUser(){
    Future<UserModel> temp = Cache.getUser();
    temp.then((value) {
      userModel = value;
      userPrepare();
    });
  }

  void userPrepare(){
  }
}