class Illusts {
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
  Series series;
  MetaSinglePage metaSinglePage;
  List<MetaPages> metaPages;
  int totalView;
  int totalBookmarks;
  bool isBookmarked;
  bool visible;
  bool isMuted;

  Illusts(
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

  Illusts.fromJson(Map<String, dynamic> json) {
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
    series =
    json['series'] != null ? new Series.fromJson(json['series']) : null;
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
    if (this.series != null) {
      data['series'] = this.series.toJson();
    }
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
  bool addedByUploadedUser;

  Tags({this.name, this.translatedName, this.addedByUploadedUser});

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    translatedName = json['translated_name'];
    addedByUploadedUser = json['added_by_uploaded_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['translated_name'] = this.translatedName;
    data['added_by_uploaded_user'] = this.addedByUploadedUser;
    return data;
  }
}


class Series {
  int id;
  String title;

  Series({this.id, this.title});

  Series.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
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


class Novels {
  int id;
  String title;
  String caption;
  int restrict;
  int xRestrict;
  bool isOriginal;
  ImageUrls imageUrls;
  String createDate;
  List<Tags> tags;
  int pageCount;
  int textLength;
  User user;
  Series series;
  bool isBookmarked;
  int totalBookmarks;
  int totalView;
  bool visible;
  int totalComments;
  bool isMuted;
  bool isMypixivOnly;
  bool isXRestricted;

  Novels(
      {this.id,
        this.title,
        this.caption,
        this.restrict,
        this.xRestrict,
        this.isOriginal,
        this.imageUrls,
        this.createDate,
        this.tags,
        this.pageCount,
        this.textLength,
        this.user,
        this.series,
        this.isBookmarked,
        this.totalBookmarks,
        this.totalView,
        this.visible,
        this.totalComments,
        this.isMuted,
        this.isMypixivOnly,
        this.isXRestricted});

  Novels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    caption = json['caption'];
    restrict = json['restrict'];
    xRestrict = json['x_restrict'];
    isOriginal = json['is_original'];
    imageUrls = json['image_urls'] != null
        ? new ImageUrls.fromJson(json['image_urls'])
        : null;
    createDate = json['create_date'];
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    pageCount = json['page_count'];
    textLength = json['text_length'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    series =
    json['series'] != null ? new Series.fromJson(json['series']) : null;
    isBookmarked = json['is_bookmarked'];
    totalBookmarks = json['total_bookmarks'];
    totalView = json['total_view'];
    visible = json['visible'];
    totalComments = json['total_comments'];
    isMuted = json['is_muted'];
    isMypixivOnly = json['is_mypixiv_only'];
    isXRestricted = json['is_x_restricted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['caption'] = this.caption;
    data['restrict'] = this.restrict;
    data['x_restrict'] = this.xRestrict;
    data['is_original'] = this.isOriginal;
    if (this.imageUrls != null) {
      data['image_urls'] = this.imageUrls.toJson();
    }
    data['create_date'] = this.createDate;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    data['page_count'] = this.pageCount;
    data['text_length'] = this.textLength;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.series != null) {
      data['series'] = this.series.toJson();
    }
    data['is_bookmarked'] = this.isBookmarked;
    data['total_bookmarks'] = this.totalBookmarks;
    data['total_view'] = this.totalView;
    data['visible'] = this.visible;
    data['total_comments'] = this.totalComments;
    data['is_muted'] = this.isMuted;
    data['is_mypixiv_only'] = this.isMypixivOnly;
    data['is_x_restricted'] = this.isXRestricted;
    return data;
  }
}


class UserPreviews {
  User user;
  List<Illusts> illusts;
  List<Novels> novels;
  bool isMuted;

  UserPreviews({this.user, this.illusts, this.novels, this.isMuted});

  UserPreviews.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['illusts'] != null) {
      illusts = new List<Illusts>();
      json['illusts'].forEach((v) {
        illusts.add(new Illusts.fromJson(v));
      });
    }
    if (json['novels'] != null) {
      novels = new List<Novels>();
      json['novels'].forEach((v) {
        novels.add(new Novels.fromJson(v));
      });
    }
    isMuted = json['is_muted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.illusts != null) {
      data['illusts'] = this.illusts.map((v) => v.toJson()).toList();
    }
    if (this.novels != null) {
      data['novels'] = this.novels.map((v) => v.toJson()).toList();
    }
    data['is_muted'] = this.isMuted;
    return data;
  }
}


class TrendTags {
  String tag;
  String translatedName;
  Illusts illust;

  TrendTags({this.tag, this.translatedName, this.illust});

  TrendTags.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
    translatedName = json['translated_name'];
    illust =
    json['illust'] != null ? new Illusts.fromJson(json['illust']) : null;
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