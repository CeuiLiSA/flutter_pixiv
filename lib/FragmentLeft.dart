
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpixiv/FragmentRecmdIllust.dart';
import 'package:flutterpixiv/base/BaseState.dart';
import 'package:flutterpixiv/models/UserModel.dart';
import 'package:flutterpixiv/right.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'http/AppApi.dart';

class Choice {
  const Choice({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '推荐作品', icon: Icons.directions_car),
  const Choice(title: '热门标签', icon: Icons.directions_bike),
];

class FragmentLeft extends StateWithUser<LeftScreen> with AutomaticKeepAliveClientMixin  {

  List<Widget> contentFragment = List();

  FragmentLeft(){
    Manager.instance;
  }

  @override
  Widget build(BuildContext context) {
    print("time FragmentLeft build 111");
    super.build(context);
    print("time FragmentLeft build 222");
    return DefaultTabController(
        length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Shaft"),
          bottom: new TabBar(
            isScrollable: false,
            tabs: choices.map((Choice choice) {
              return new Tab(
                text: choice.title,
              );
            }).toList(),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
        body: new TabBarView(
          children: contentFragment,
        ),
      ),
    );

  }

  @override
  userPrepare() {
    print("time FragmentLeft userPrepare");
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    contentFragment.add(RecmdIllust());
    contentFragment.add(RightScreen());
  }
}


class LeftScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FragmentLeft();
  }
}