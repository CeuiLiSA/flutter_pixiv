import 'Beans.dart';

class ListIllustResponse {
  List<Illusts> illusts;
  String nextUrl;

  ListIllustResponse({this.illusts, this.nextUrl});

  ListIllustResponse.fromJson(Map<String, dynamic> json) {
    if (json['illusts'] != null) {
      illusts = new List<Illusts>();
      json['illusts'].forEach((v) {
        illusts.add(new Illusts.fromJson(v));
      });
    }
    nextUrl = json['next_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.illusts != null) {
      data['illusts'] = this.illusts.map((v) => v.toJson()).toList();
    }
    data['next_url'] = this.nextUrl;
    return data;
  }
}

class ListUserResponse {
  List<UserPreviews> userPreviews;
  String nextUrl;

  ListUserResponse({this.userPreviews, this.nextUrl});

  ListUserResponse.fromJson(Map<String, dynamic> json) {
    if (json['user_previews'] != null) {
      userPreviews = new List<UserPreviews>();
      json['user_previews'].forEach((v) {
        userPreviews.add(new UserPreviews.fromJson(v));
      });
    }
    nextUrl = json['next_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userPreviews != null) {
      data['user_previews'] = this.userPreviews.map((v) => v.toJson()).toList();
    }
    data['next_url'] = this.nextUrl;
    return data;
  }
}

class ListNovelResponse {
  List<Novels> novels;
  String nextUrl;

  ListNovelResponse({this.novels, this.nextUrl});

  ListNovelResponse.fromJson(Map<String, dynamic> json) {
    if (json['novels'] != null) {
      novels = new List<Novels>();
      json['novels'].forEach((v) {
        novels.add(new Novels.fromJson(v));
      });
    }
    nextUrl = json['next_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.novels != null) {
      data['novels'] = this.novels.map((v) => v.toJson()).toList();
    }
    data['next_url'] = this.nextUrl;
    return data;
  }
}

class ListTagResponse {
  List<TrendTags> trendTags;

  ListTagResponse({this.trendTags});

  ListTagResponse.fromJson(Map<String, dynamic> json) {
    if (json['trend_tags'] != null) {
      trendTags = new List<TrendTags>();
      json['trend_tags'].forEach((v) {
        trendTags.add(new TrendTags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trendTags != null) {
      data['trend_tags'] = this.trendTags.map((v) => v.toJson()).toList();
    }
    return data;
  }
}