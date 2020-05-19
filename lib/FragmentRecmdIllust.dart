import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterpixiv/Common.dart';
import 'package:flutterpixiv/base/BaseState.dart';
import 'package:flutterpixiv/http/AppApi.dart';
import 'package:flutterpixiv/models/Beans.dart';
import 'package:flutterpixiv/models/Resp.dart';
import 'package:flutterpixiv/ui/ViewPagerActivity.dart';
import 'package:flutterpixiv/ui/img.dart';

import 'http/JsonUtil.dart';

class FragmentRecmdIllust extends StateWithUser<RecmdIllust>
    with AutomaticKeepAliveClientMixin {
  final List<Illusts> allItems = new List();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
        onRefresh: please,
        color: Colors.blue,
        child: StaggeredGridView.countBuilder(
          padding: const EdgeInsets.all(4.0),
          crossAxisCount: 4,
          itemCount: allItems.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(4)),
                  clipBehavior: Clip.antiAlias,
                  child: getIllust(allItems[i])),
              onTap: () {
                Navigator.push(
                  //跳转到第二个界面
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewPagerScreen(),
                      settings: RouteSettings(
                          arguments: {"items": allItems, "index": i})),
                );
              },
            );
          },
          staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
        ));
  }

  @override
  bool get wantKeepAlive => true;

  Future<Void> please() {
    Common.toast('刷新完毕');
    return Future<Void>(null);
  }

  @override
  void userPrepare() {
    AppApi.getWalkThrough(userModel.response.accessToken).then((value) {
      JsonUtil.printJson(value);

      Map<String, dynamic> map = json.decode(value.data.toString());
      ListIllustResponse list = ListIllustResponse.fromJson(map);

      setState(() {
        allItems.addAll(list.illusts);
      });
    });
  }
}

class RecmdIllust extends StatefulWidget {
  @override
  FragmentRecmdIllust createState() {
    return FragmentRecmdIllust();
  }
}
