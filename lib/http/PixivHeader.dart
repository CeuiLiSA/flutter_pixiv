

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class PixivHeader{


  String XClientTime = "";
  String XClientHash = "";
  static final sort = "28c1fdd170a5204386cb1313c7077b34f83e4aaf4aa829ce78c231e05b0bae2c";

  PixivHeader(){


    var formatter = new DateFormat("yyyy-MM-dd'T'HH:mm:ss");
    XClientTime = formatter.format(DateTime.now()) + "+08:00";


    String temp = XClientTime + sort;
    XClientHash = generateMd5(temp);

    print("login XClientTime " + XClientTime);
    print("login XClientHash " + XClientHash);

  }

  String generateMd5(String data) {
    return md5.convert(utf8.encode(data)).toString();
  }
}