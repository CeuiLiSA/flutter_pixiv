import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Cache.dart';
import 'http/AppApi.dart';
import 'http/JsonUtil.dart';
import 'models/UserModel.dart';

class FragmentRight extends State<RightScreen> with AutomaticKeepAliveClientMixin {

  List<Shadow> shadowList = new List();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    shadowList.add(new Shadow(
      //阴影颜色
        color: Colors.black45,
        //模糊程度
        blurRadius: 3.0));
    getTags();
    return new GridView.extent(
        maxCrossAxisExtent: 150.0,
        padding: const EdgeInsets.all(0.0),
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
        children: _buildGridTileList(30));


  }




  List<Container> _buildGridTileList(int count) {
    return new List<Container>.generate(
        count,
            (int index) => Container(
          child: Stack(
            children: <Widget>[
              ConstrainedBox(
                child:  CachedNetworkImage(
                  imageUrl: "https://pixiv.cat/81391958.jpg",
                  fit: BoxFit.cover,
                ),
                constraints: new BoxConstraints.expand(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "标签${index + 1}",
                  style: TextStyle(
                    fontSize: 16,
                    shadows: shadowList,
                    color: Colors.white,
                  ),
                ),
              )

            ],
          ),
        ));
  }

  getTags() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userJson = pref.getString(Cache.user);
    Map<String, dynamic> map = json.decode(userJson);
    UserModel userModel = UserModel.fromJson(map);

    AppApi.getHotTags(userModel.response.accessToken).then((value) {

      JsonUtil.printRespond(value);

    });
  }

  @override
  bool get wantKeepAlive => true;
}


class RightScreen extends StatefulWidget {

  @override
  FragmentRight createState() => FragmentRight();

}