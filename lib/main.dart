import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterpixiv/Common.dart';
import 'package:flutterpixiv/http/LoginApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'tools/Cache.dart';
import 'main_activity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: MyHomePage(title: 'Shaft'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();


  bool isLogin = false;

//  TextEditingController pwd = TextEditingController();
  TextEditingController pwd = TextEditingController.fromValue(TextEditingValue(
      text: "Mercis09v",
      selection: TextSelection.fromPosition(TextPosition(
          affinity: TextAffinity.downstream, offset: "Mercis09v".length))));

  void judge() {
    if (name.text.length == 0) {
      Common.toast("请输入用户名");

      return;
    }

    if (pwd.text.length == 0) {
      Common.toast("请输入密码");
      return;
    }

    if(isLogin) {
      Navigator.push(
        //跳转到第二个界面
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(),
        ),
      );
    } else {
      Login().login(name.text, pwd.text, context);
    }
  }

  @override
  void initState() {
    super.initState();

    Cache.getUser().then((value) {
      isLogin = value != null ? true : false;
    });
  }


  @override
  Widget build(BuildContext context) {
    name.text = "user_shaft";

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: SizedBox(
              height: 360,
              child: Stack(children: <Widget>[
                Align(
                  child: Card(
                    // Center is a layout widget. It takes a single child and positions it
                    // in the middle of the parent.
                    elevation: 16.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        // Column is also a layout widget. It takes a list of children and
                        // arranges them vertically. By default, it sizes itself to fit its
                        // children horizontally, and tries to be as tall as its parent.
                        //
                        // Invoke "debug painting" (press "p" in the console, choose the
                        // "Toggle Debug Paint" action from the Flutter Inspector in Android
                        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                        // to see the wireframe for each widget.
                        //
                        // Column has various properties to control how it sizes itself and
                        // how it positions its children. Here we use mainAxisAlignment to
                        // center the children vertically; the main axis here is the vertical
                        // axis because Columns are vertical (the cross axis would be
                        // horizontal).
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 230,
                              child: TextField(
                                controller: name,
                                decoration: InputDecoration(
                                  hintText: '用户名/邮箱账号',
                                ),
                                style: TextStyle(),
                                textAlign: TextAlign.start,
                              )),
                          Container(
                              padding: EdgeInsets.only(bottom: 50),
                              width: 230,
                              child: TextField(
                                controller: pwd,
                                obscureText: true,
                                decoration: InputDecoration(hintText: '密码'),
                                style: TextStyle(),
                                textAlign: TextAlign.start,
                              )),
                          MaterialButton(
                            elevation: 8,
                            minWidth: 230,
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: new Text(
                              "登录",
                            ),
                            onPressed: () {
                              judge();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Shaft(测试版)",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Text(
                        "没有账号？",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ))
              ])),
        ),
        Align(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(
              "使用条款",
              style: TextStyle(color: Colors.white),
            ),
          ),
          alignment: Alignment.bottomCenter,
        )
      ]),
    );
  }
}
