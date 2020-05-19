import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_printer/flutter_printer.dart';
import 'package:flutterpixiv/base/BaseState.dart';
import 'package:flutterpixiv/models/Beans.dart';
import 'package:flutterpixiv/models/Resp.dart';
import 'package:flutterpixiv/ui/img.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'tools/Cache.dart';
import 'http/AppApi.dart';
import 'http/JsonUtil.dart';
import 'models/UserModel.dart';

class FragmentRight extends StateWithUser<RightScreen> with AutomaticKeepAliveClientMixin {

  List<Shadow> shadowList = List();
  List<TrendTags> allItems = List();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    shadowList.add(new Shadow(
      //阴影颜色
        color: Colors.black26,
        //模糊程度
        blurRadius: 3.0));
    return new GridView.extent(
        maxCrossAxisExtent: 150.0,
        padding: const EdgeInsets.all(0.0),
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: _buildGridTileList(allItems.length));
  }

  List<Container> _buildGridTileList(count) {
    return List<Container>.generate(
        count,
            (int index) => Container(
          child: Stack(
            children: <Widget>[
              ConstrainedBox(
                child: getIllust(allItems[index].illust),
                constraints: new BoxConstraints.expand(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  allItems[index].tag,
                  style: TextStyle(
                    fontSize: 14,
                    shadows: shadowList,
                    color: Colors.white,
                  ),
                ),
              )

            ],
          ),
        ));
  }

  @override
  void userPrepare() {
    AppApi.getHotTags(userModel.response.accessToken).then((value) {
      JsonUtil.printRespond(value);

      Map<String, dynamic> map = json.decode(value.data.toString());
      ListTagResponse list = ListTagResponse.fromJson(map);

      setState(() {
        allItems.addAll(list.trendTags);
      });
    });
  }

  @override
  bool get wantKeepAlive => true;
}


class RightScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FragmentRight();
  }
}