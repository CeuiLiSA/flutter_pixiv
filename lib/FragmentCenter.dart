import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'http/AppApi.dart';

class FragmentCenter extends State<CenterScreen> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {

    Manager.instance;
    super.build(context);
    return Center(
        child: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index)
            {
              return ListTile(
                title: Text("我是第$index条数据，哈哈哈哈哈哈"),
              );
            }));
  }

  @override
  bool get wantKeepAlive => true;
}


class CenterScreen extends StatefulWidget {

  @override
  FragmentCenter createState() => FragmentCenter();
}