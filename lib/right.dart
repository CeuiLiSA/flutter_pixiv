import 'package:flutter/cupertino.dart';

class FragmentRight extends State<RightScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Text("发现"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


class RightScreen extends StatefulWidget {

  @override
  FragmentRight createState() => FragmentRight();
}