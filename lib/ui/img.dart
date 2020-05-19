import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutterpixiv/models/Beans.dart';

Widget getIllust(Illusts illust) {
  return Image(
      image: AdvancedNetworkImage(
        illust.imageUrls.medium,
        header: {"referer": "https://app-api.pixiv.net/"},
        useDiskCache: true,
        cacheRule: CacheRule(maxAge: const Duration(days: 7)),
      ),
      fit: BoxFit.cover,
  );
}

Widget getLargeIllust(Illusts illust) {
  return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Image(
        image: AdvancedNetworkImage(
          illust.imageUrls.large,
          header: {"referer": "https://app-api.pixiv.net/"},
          useDiskCache: true,
          cacheRule: CacheRule(maxAge: const Duration(days: 7)),
        ),
        fit: BoxFit.cover,
      ));
}
