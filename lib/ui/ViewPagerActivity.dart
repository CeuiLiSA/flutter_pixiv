import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterpixiv/FragmentSingleIllust.dart';
import 'package:flutterpixiv/base/BaseState.dart';
import 'package:flutterpixiv/models/Beans.dart';

class ViewPagerActivity extends StateWithUser<ViewPagerScreen>
    with AutomaticKeepAliveClientMixin {

  List<Illusts> allItems = List();
  int currentIndex = 0;
  PageController controller;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    allItems.clear();
    Map<String, dynamic> intent = ModalRoute.of(context).settings.arguments;
    if(intent != null) {
      List<Illusts> temp = intent["items"];
      currentIndex = intent["index"];
      if(temp != null && temp.length != 0) {
        allItems.addAll(temp);
      }
    }

    controller = PageController(initialPage: currentIndex);

    return PageView.builder(
        controller: controller,
        itemCount: allItems.length,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          return SingleIllust(allItems[index]);
        },
        onPageChanged: (index) {
          if (index != controller) {
            setState(() {
              currentIndex = index;
            });
          }
        },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ViewPagerScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ViewPagerActivity();
  }
}
