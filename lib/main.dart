import 'package:flutter/material.dart';
import 'package:flutterpixiv/Common.dart';
import 'package:flutterpixiv/right.dart';

import 'center.dart';
import 'left.dart';
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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
  TextEditingController pwd = TextEditingController();

  void judge() {
    if (name.text.length == 0) {
      Common.toast("请输入用户名");

      return;
    }

    if (pwd.text.length == 0) {
      Common.toast("请输入密码");
      return;
    }

    login(name.text, pwd.text);
  }

  void login(String name, String pwd) {
    Navigator.push( //跳转到第二个界面
      context,
      MaterialPageRoute(builder: (context) => SecondScreen()),
    );
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Stack(
          children: <Widget>[
            Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
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
                      width: 240,
                      child: TextField(
                        controller: name,
                        decoration: InputDecoration(
                          hintText: '用户名',
                        ),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.start,
                      )),
                  Container(
                      padding: EdgeInsets.only(bottom: 50),
                      width: 240,
                      child: TextField(
                        controller: pwd,
                        decoration: InputDecoration(hintText: '密码'),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.start,
                      )),
                  MaterialButton(
                    minWidth: 240,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text('登录'),
                    onPressed: () {
                      judge();
                    },
                  ),
                ],
              ),
            ),

            Align(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                    "关于软件",
                  style: TextStyle(color: Colors.blue),
                ),
            ),
              alignment: Alignment.bottomCenter,
            )
          ]
      ),
    );
  }
}
