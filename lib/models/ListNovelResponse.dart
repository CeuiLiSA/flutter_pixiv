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

class ImageUrls {
  String squareMedium;
  String medium;
  String large;

  ImageUrls({this.squareMedium, this.medium, this.large});

  ImageUrls.fromJson(Map<String, dynamic> json) {
    squareMedium = json['square_medium'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['square_medium'] = this.squareMedium;
    data['medium'] = this.medium;
    data['large'] = this.large;
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