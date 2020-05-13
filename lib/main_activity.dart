import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpixiv/right.dart';

import 'center.dart';
import 'left.dart';

class SecondScreen extends StatefulWidget {

  SecondScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<SecondScreen>{

  int _currentIndex = 0;
  final List<Widget> _pages = List();
  PageController _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages.add(LeftScreen());
    _pages.add(CenterScreen());
    _pages.add(RightScreen());
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _buildBodyWidget() {
    return PageView.builder(
      controller: _controller,
      itemCount: _pages.length,
      physics: ScrollPhysics(),
      itemBuilder: (context, index) {
        return _pages[index];
      },
      onPageChanged: (index) {
        if (index != _controller) {
          setState(() {
            _currentIndex = index;
          });
        }
      },
    );
  }

  Widget _buildBottomNavigationBarWidget() {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('推荐'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('发现'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('动态'),
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          _controller.jumpToPage(index);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shaft"),
      ),
      body: _buildBodyWidget(),
      bottomNavigationBar: _buildBottomNavigationBarWidget(),
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
    );
  }
}