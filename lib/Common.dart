import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Common{


  static void toast(String string){
    Fluttertoast.showToast(
        msg: string,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue,
        textColor: Colors.white
    );
  }

  static void log(Object object){
    print(object);
  }

}