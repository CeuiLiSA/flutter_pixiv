import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpixiv/UserModel.dart';
import 'package:http/http.dart' as http;

class FragmentLeft extends State<LeftScreen> with AutomaticKeepAliveClientMixin  {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialButton(
      onPressed: (){
        postRequest();
      },
      child: Text("推荐"),
    );
  }

  @override
  bool get wantKeepAlive => true;


  void postRequest() async {

    var client = http.Client();
    http.Response response = await client.get("http://yxgtest.bangjia.me/Api/Index/login2/?password=c33367701511b4f6020ec61ded352059&flag=android&mobile=15026844205&imei=06b45d42-3fef-4376-9981-110be6cea92f&apkversion=1.1.13");
    var _content = response.body;



    Map<String, dynamic> news1 = jsonDecode(_content);
    //转为实体类
    UserModel userModel = UserModel.fromJson(news1);


    print(userModel.element.username);
  }
}


class LeftScreen extends StatefulWidget {

  @override
  FragmentLeft createState() => FragmentLeft();
}