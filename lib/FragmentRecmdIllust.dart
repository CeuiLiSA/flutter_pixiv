import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterpixiv/Common.dart';
import 'package:flutterpixiv/models/Illust.dart';

import 'FragmentSingleIllust.dart';

class FragmentRecmdIllust extends State<RecmdIllust>
    with AutomaticKeepAliveClientMixin {
  final List<String> urls = new List();

  @override
  void initState() {
    super.initState();
    urls.add("https://pixiv.cat/53496279.jpg");
    urls.add("https://pixiv.cat/57350017.jpg");
    urls.add("https://pixiv.cat/14184347.jpg");
    urls.add("https://pixiv.cat/50364986.jpg");
    urls.add("https://pixiv.cat/33518302.jpg");
    urls.add("https://pixiv.cat/53495177.jpg");
    urls.add("https://pixiv.cat/35782590.jpg");
    urls.add("https://pixiv.cat/42840291.jpg");
    urls.add("https://pixiv.cat/59031459.jpg");
    urls.add("https://pixiv.cat/44876609.jpg");
    urls.add("https://pixiv.cat/50688289.jpg");
    urls.add("https://pixiv.cat/53428576.jpg");
    urls.add("https://pixiv.cat/15002788.jpg");
    urls.add("https://pixiv.cat/54156275.jpg");
    urls.add("https://pixiv.cat/33598021.jpg");
    urls.add("https://pixiv.cat/16471848.jpg");
    urls.add("https://pixiv.cat/24244579.jpg");
    urls.add("https://pixiv.cat/57526556.jpg");
    urls.add("https://pixiv.cat/34025296.jpg");
    urls.add("https://pixiv.cat/57681432.jpg");
    urls.add("https://pixiv.cat/42866322.jpg");
    urls.add("https://pixiv.cat/23846900.jpg");
    urls.add("https://pixiv.cat/10731349.jpg");
    urls.add("https://pixiv.cat/46808609.jpg");
    urls.add("https://pixiv.cat/49979385.jpg");
    urls.add("https://pixiv.cat/53737603.jpg");
    urls.add("https://pixiv.cat/27707042.jpg");
    urls.add("https://pixiv.cat/46734725.jpg");
    urls.add("https://pixiv.cat/30581472.jpg");
    urls.add("https://pixiv.cat/43216803.jpg");
    urls.add("https://pixiv.cat/44403643.jpg");
    urls.add("https://pixiv.cat/19982051.jpg");
    urls.add("https://pixiv.cat/21574388.jpg");
    urls.add("https://pixiv.cat/50528486.jpg");
    urls.add("https://pixiv.cat/50606272.jpg");
    urls.add("https://pixiv.cat/38431299.jpg");
    urls.add("https://pixiv.cat/57291740.jpg");
    urls.add("https://pixiv.cat/12438583.jpg");
    urls.add("https://pixiv.cat/23087254.jpg");
    urls.add("https://pixiv.cat/52677282.jpg");
    urls.add("https://pixiv.cat/16761969.jpg");
    urls.add("https://pixiv.cat/51160511.jpg");
    urls.add("https://pixiv.cat/10859558.jpg");
    urls.add("https://pixiv.cat/29049814.jpg");
    urls.add("https://pixiv.cat/53250514.jpg");
    urls.add("https://pixiv.cat/22002501.jpg");
    urls.add("https://pixiv.cat/41440438.jpg");
    urls.add("https://pixiv.cat/13534647.jpg");
    urls.add("https://pixiv.cat/53488982.jpg");
    urls.add("https://pixiv.cat/28102095.jpg");
    urls.add("https://pixiv.cat/23419930.jpg");
    urls.add("https://pixiv.cat/39957555.jpg");
    urls.add("https://pixiv.cat/45068168.jpg");
    urls.add("https://pixiv.cat/29860639.jpg");
    urls.add("https://pixiv.cat/8369938.jpg");
    urls.add("https://pixiv.cat/53491663.jpg");
    urls.add("https://pixiv.cat/46221486.jpg");
    urls.add("https://pixiv.cat/33787607.jpg");
    urls.add("https://pixiv.cat/45464867.jpg");
    urls.add("https://pixiv.cat/40761380.jpg");
    urls.add("https://pixiv.cat/30384793.jpg");
    urls.add("https://pixiv.cat/30971623.jpg");
    urls.add("https://pixiv.cat/40289952.jpg");
    urls.add("https://pixiv.cat/48053793.jpg");
    urls.add("https://pixiv.cat/13461444.jpg");
    urls.add("https://pixiv.cat/58122126.jpg");
    urls.add("https://pixiv.cat/40586045.jpg");
    urls.add("https://pixiv.cat/43040228.jpg");
    urls.add("https://pixiv.cat/36224612.jpg");
    urls.add("https://pixiv.cat/35422846.jpg");
    urls.add("https://pixiv.cat/33986574.jpg");
    urls.add("https://pixiv.cat/37993338.jpg");
    urls.add("https://pixiv.cat/17214248.jpg");
    urls.add("https://pixiv.cat/38631998.jpg");
    urls.add("https://pixiv.cat/38722881.jpg");
    urls.add("https://pixiv.cat/56213875.jpg");
    urls.add("https://pixiv.cat/35570299.jpg");
    urls.add("https://pixiv.cat/45444349.jpg");
    urls.add("https://pixiv.cat/56001614.jpg");
    urls.add("https://pixiv.cat/20395376.jpg");
    urls.add("https://pixiv.cat/53489440.jpg");
    urls.add("https://pixiv.cat/40294767.jpg");
    urls.add("https://pixiv.cat/2124805.jpg");
    urls.add("https://pixiv.cat/53388604.jpg");
    urls.add("https://pixiv.cat/46718715.jpg");
    urls.add("https://pixiv.cat/26424396.jpg");
    urls.add("https://pixiv.cat/53496095.jpg");
    urls.add("https://pixiv.cat/41244310.jpg");
    urls.add("https://pixiv.cat/52231018.jpg");
    urls.add("https://pixiv.cat/41139423.jpg");
    urls.add("https://pixiv.cat/48466332.jpg");
    urls.add("https://pixiv.cat/44920385.jpg");
    urls.add("https://pixiv.cat/21440268.jpg");
    urls.add("https://pixiv.cat/24471556.jpg");
    urls.add("https://pixiv.cat/47514040.jpg");
    urls.add("https://pixiv.cat/42203380.jpg");
    urls.add("https://pixiv.cat/50680532.jpg");
    urls.add("https://pixiv.cat/44108346.jpg");
    urls.add("https://pixiv.cat/42140983.jpg");
    urls.add("https://pixiv.cat/48723512.jpg");
    urls.add("https://pixiv.cat/28680466.jpg");
    urls.add("https://pixiv.cat/40180063.jpg");
    urls.add("https://pixiv.cat/17974103.jpg");
    urls.add("https://pixiv.cat/57862620.jpg");
    urls.add("https://pixiv.cat/22350647.jpg");
    urls.add("https://pixiv.cat/22025728.jpg");
    urls.add("https://pixiv.cat/17184292.jpg");
    urls.add("https://pixiv.cat/47773952.jpg");
    urls.add("https://pixiv.cat/36633503.jpg");
    urls.add("https://pixiv.cat/29037981.jpg");
    urls.add("https://pixiv.cat/31993051.jpg");
    urls.add("https://pixiv.cat/53488027.jpg");
    urls.add("https://pixiv.cat/48552958.jpg");
    urls.add("https://pixiv.cat/41783556.jpg");
    urls.add("https://pixiv.cat/48256902.jpg");
    urls.add("https://pixiv.cat/16347313.jpg");
    urls.add("https://pixiv.cat/55877322.jpg");
    urls.add("https://pixiv.cat/35902979.jpg");
    urls.add("https://pixiv.cat/42208869.jpg");
    urls.add("https://pixiv.cat/38566067.jpg");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: please,
        color: Colors.blue,
        child: StaggeredGridView.countBuilder(
          padding: const EdgeInsets.all(8.0),
          crossAxisCount: 4,
          itemCount: urls.length,
          itemBuilder: (context, i) {
            String imgPath = urls[i];
            return GestureDetector(
              child: CachedNetworkImage(
                imageUrl: imgPath,
                fit: BoxFit.fitWidth,
              ),
              onTap: () {
                Illust temp = Illust();
                temp.title = urls[i];

                Navigator.push(
                  //跳转到第二个界面
                  context,
                  MaterialPageRoute(builder: (context) =>
                      SingleIllust(),
                    settings: RouteSettings(
                      arguments: temp
                    )

                  ),
                );
              },
            );
          },
          staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
          mainAxisSpacing:4.0,
          crossAxisSpacing: 4.0,
        )
    );
  }

  @override
  bool get wantKeepAlive => true;

  Future<Void> please() {
    Common.toast('开始刷新');
    return Future<Void>(null);
  }
}

class RecmdIllust extends StatefulWidget {
  @override
  FragmentRecmdIllust createState() {
    return FragmentRecmdIllust();
  }
}
