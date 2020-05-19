import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterpixiv/models/Beans.dart';
import 'package:flutterpixiv/ui/img.dart';

import 'base/BaseState.dart';

class FragmentSingleIllust extends StateWithUser<SingleIllust>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    Illusts illust = widget.illusts;
    return Scaffold(
        appBar: AppBar(
          title: Text(illust.title),
        ),
        body: new CustomScrollView(shrinkWrap: true,
            // 内容
            slivers: <Widget>[
              new SliverPadding(
                padding: EdgeInsets.all(0.0),
                sliver: new SliverList(
                  delegate: new SliverChildListDelegate(
                    <Widget>[
                      Container(
                        child: getLargeIllust(illust),
                        margin: EdgeInsets.all(8),
                      ),
                      Container(
                        child: getLargeIllust(illust),
                        margin: EdgeInsets.all(8),
                      )
                    ],
                  ),
                ),
              )
            ]));
  }

  @override
  bool get wantKeepAlive => true;
}

class SingleIllust extends StatefulWidget {
  Illusts illusts;

  SingleIllust(Illusts i) {
    illusts = i;
  }

  @override
  State<StatefulWidget> createState() {
    return FragmentSingleIllust();
  }
}
