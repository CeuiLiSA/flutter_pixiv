class TagResponse {
  List<TrendTags> trendTags;

  TagResponse({this.trendTags});

  TagResponse.fromJson(Map<String, dynamic> json) {
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

class TrendTags {
  String tag;
  String translatedName;
  Illust illust;

  TrendTags({this.tag, this.translatedName, this.illust});

  TrendTags.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
    translatedName = json['translated_name'];
    illust =
    json['illust'] != null ? new Illust.fromJson(json['illust']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tag'] = this.tag;
    data['translated_name'] = this.translatedName;
    if (this.illust != null) {
      data['illust'] = this.illust.toJson();
    }
    return data;
  }
}

class Illust {
  int id;
  String title;
  String type;
  ImageUrls imageUrls;
  String caption;
  int restrict;
  User user;
  List<Tags> tags;
  List<String> tools;
  String createDate;
  int pageCount;
  int width;
  int height;
  int sanityLevel;
  int xRestrict;
  Null series;
  MetaSinglePage metaSinglePage;
  List<MetaPages> metaPages;
  int totalView;
  int totalBookmarks;
  bool isBookmarked;
  bool visible;
  bool isMuted;

  Illust(
      {this.id,
        this.title,
        this.type,
        this.imageUrls,
        this.caption,
        this.restrict,
        this.user,
        this.tags,
        this.tools,
        this.createDate,
        this.pageCount,
        this.width,
        this.height,
        this.sanityLevel,
        this.xRestrict,
        this.series,
        this.metaSinglePage,
        this.metaPages,
        this.totalView,
        this.totalBookmarks,
        this.isBookmarked,
        this.visible,
        this.isMuted});

  Illust.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    imageUrls = json['image_urls'] != null
        ? new ImageUrls.fromJson(json['image_urls'])
        : null;
    caption = json['caption'];
    restrict = json['restrict'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    tools = json['tools'].cast<String>();
    createDate = json['create_date'];
    pageCount = json['page_count'];
    width = json['width'];
    height = json['height'];
    sanityLevel = json['sanity_level'];
    xRestrict = json['x_restrict'];
    series = json['series'];
    metaSinglePage = json['meta_single_page'] != null
        ? new MetaSinglePage.fromJson(json['meta_single_page'])
        : null;
    if (json['meta_pages'] != null) {
      metaPages = new List<MetaPages>();
      json['meta_pages'].forEach((v) {
        metaPages.add(new MetaPages.fromJson(v));
      });
    }
    totalView = json['total_view'];
    totalBookmarks = json['total_bookmarks'];
    isBookmarked = json['is_bookmarked'];
    visible = json['visible'];
    isMuted = json['is_muted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    if (this.imageUrls != null) {
      data['image_urls'] = this.imageUrls.toJson();
    }
    data['caption'] = this.caption;
    data['restrict'] = this.restrict;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    data['tools'] = this.tools;
    data['create_date'] = this.createDate;
    data['page_count'] = this.pageCount;
    data['width'] = this.width;
    data['height'] = this.height;
    data['sanity_level'] = this.sanityLevel;
    data['x_restrict'] = this.xRestrict;
    data['series'] = this.series;
    if (this.metaSinglePage != null) {
      data['meta_single_page'] = this.metaSinglePage.toJson();
    }
    if (this.metaPages != null) {
      data['meta_pages'] = this.metaPages.map((v) => v.toJson()).toList();
    }
    data['total_view'] = this.totalView;
    data['total_bookmarks'] = this.totalBookmarks;
    data['is_bookmarked'] = this.isBookmarked;
    data['visible'] = this.visible;
    data['is_muted'] = this.isMuted;
    return data;
  }
}


class User {
  int id;
  String name;
  String account;
  ProfileImageUrls profileImageUrls;
  bool isFollowed;

  User(
      {this.id,
        this.name,
        this.account,
        this.profileImageUrls,
        this.isFollowed});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    account = json['account'];
    profileImageUrls = json['profile_image_urls'] != null
        ? new ProfileImageUrls.fromJson(json['profile_image_urls'])
        : null;
    isFollowed = json['is_followed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['account'] = this.account;
    if (this.profileImageUrls != null) {
      data['profile_image_urls'] = this.profileImageUrls.toJson();
    }
    data['is_followed'] = this.isFollowed;
    return data;
  }
}

class ProfileImageUrls {
  String medium;

  ProfileImageUrls({this.medium});

  ProfileImageUrls.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = this.medium;
    return data;
  }
}

class Tags {
  String name;
  String translatedName;

  Tags({this.name, this.translatedName});

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    translatedName = json['translated_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['translated_name'] = this.translatedName;
    return data;
  }
}

class MetaSinglePage {
  String originalImageUrl;

  MetaSinglePage({this.originalImageUrl});

  MetaSinglePage.fromJson(Map<String, dynamic> json) {
    originalImageUrl = json['original_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original_image_url'] = this.originalImageUrl;
    return data;
  }
}

class MetaPages {
  ImageUrls imageUrls;

  MetaPages({this.imageUrls});

  MetaPages.fromJson(Map<String, dynamic> json) {
    imageUrls = json['image_urls'] != null
        ? new ImageUrls.fromJson(json['image_urls'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.imageUrls != null) {
      data['image_urls'] = this.imageUrls.toJson();
    }
    return data;
  }
}

class ImageUrls {
  String squareMedium;
  String medium;
  String large;
  String original;

  ImageUrls({this.squareMedium, this.medium, this.large, this.original});

  ImageUrls.fromJson(Map<String, dynamic> json) {
    squareMedium = json['square_medium'];
    medium = json['medium'];
    large = json['large'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['square_medium'] = this.squareMedium;
    data['medium'] = this.medium;
    data['large'] = this.large;
    data['original'] = this.original;
    return data;
  }
}