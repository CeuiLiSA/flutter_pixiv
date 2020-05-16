import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class JsonUtil {
  //带有首行缩进的Json格式
  static JsonEncoder encoder = JsonEncoder.withIndent('  ');

  /// 单纯的Json格式输出打印
  static void printJson(Object object) {
    try {
      var encoderString = encoder.convert(object);
      // print(encoderString);
      // 不使用print()方法是因为这是单条输出，如果过长无法显示全
      // 所以使用debugPrint()
      debugPrint(encoderString);
      // 下面这语句的效果与debugPrint 相同
      //encoderString.split('\n').forEach((element) => print(element));
    } catch (e) {
      print(e);
    }
  }

  /// 接收Dio请求库返回的Response对象
  static void printRespond(Response response) {
    Map httpLogMap = Map();
    httpLogMap.putIfAbsent("requestUrl", () => "${response.request.uri}");
    httpLogMap.putIfAbsent("requestHeaders", () => response.request.headers);
    httpLogMap.putIfAbsent(
        "requestQueryParameters", () => response.request.queryParameters);
    httpLogMap.putIfAbsent("respondData", () => response.data);

    printJson(httpLogMap);
  }
}