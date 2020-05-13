import 'package:flutter/cupertino.dart';

class FragmentLeft extends State<LeftScreen> with AutomaticKeepAliveClientMixin  {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Text("推荐"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


class LeftScreen extends StatefulWidget {

  @override
  FragmentLeft createState() => FragmentLeft();
}