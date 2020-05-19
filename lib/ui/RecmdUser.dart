import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterpixiv/Common.dart';
import 'package:flutterpixiv/base/BaseState.dart';
import 'package:flutterpixiv/http/AppApi.dart';
import 'package:flutterpixiv/http/JsonUtil.dart';
import 'package:flutterpixiv/models/Beans.dart';
import 'package:flutterpixiv/models/Resp.dart';
import 'package:flutterpixiv/ui/img.dart';

class FragmentRecmdUser extends StateWithUser<RecmdUser>
    with AutomaticKeepAliveClientMixin {
  List<UserPreviews> allItems = List();
  bool isLoding = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(child: initView());
  }

  initView() {
    if (isLoding) {
      return SpinKitCubeGrid(
        color: Colors.blue,
        size: 50.0,
        duration: Duration(milliseconds: 800),
      );
    } else {
      return ListView.builder(
          itemCount: allItems.length,
          itemBuilder: (context, index) {
            return Card(
                elevation: 12.0,
                margin: EdgeInsets.fromLTRB(8, 6, 8, 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                ),
                child: Column(
                  children: <Widget>[
                    Card(
                      color: Colors.blue,
                          child:getItem(index),
                    ),
                    ListTile(
                      title: Text("我是第$index条数据，" + allItems[index].user.name),
                    )
                  ],
                ));
          });
    }
  }

  getItem(int index) {
    if (allItems[index].illusts != null &&
        allItems[index].illusts.length == 3) {
      return Container(
        color: Colors.blue,
        margin: EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
                child: new AspectRatio(
                  aspectRatio: 1,
                  child: getIllust(allItems[index].illusts[0]),
                )),
            Expanded(
                child: new AspectRatio(
                  aspectRatio: 1,
                  child: getIllust(allItems[index].illusts[1]),
                )),
            Expanded(
                child: new AspectRatio(
                  aspectRatio: 1,
                  child: getIllust(allItems[index].illusts[2]),
                )),
          ],
        ),
      );
    }
    return Container();
  }

  @override
  void userPrepare() {
    AppApi.getRecmdUser(userModel.response.accessToken).then((value) {
      JsonUtil.printJson(value);

      Map<String, dynamic> map = json.decode(value.data.toString());
      ListUserResponse list = ListUserResponse.fromJson(map);

      setState(() {
        isLoding = false;
        allItems.addAll(list.userPreviews);
      });
      Common.log("FragmentRecmdUser " + allItems.length.toString());
    });
  }

  @override
  bool get wantKeepAlive => true;
}

class RecmdUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FragmentRecmdUser();
  }
}
