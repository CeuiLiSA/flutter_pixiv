


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base/BaseState.dart';
import 'models/Illust.dart';

class FragmentSingleIllust extends StateWithUser<SingleIllust> with AutomaticKeepAliveClientMixin{

  Illust illust;
  String titleString = "";

  @override
  Widget build(BuildContext context) {
    super.build(context);

    illust = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(titleString),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.fromLTRB(12, 12, 12, 16),
            color: Colors.white,
            elevation: 20,
            child: CachedNetworkImage(
              imageUrl: illust.title,
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }

  @override
  void userPrepare() {
    super.userPrepare();
    setState(() {
      titleString = userModel.response.user.account;
    });
  }


  @override
  bool get wantKeepAlive => true;
}


class SingleIllust extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FragmentSingleIllust();
  }
}