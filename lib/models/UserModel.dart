class UserModel {
  Response response;

  UserModel({this.response});

  UserModel.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response.toJson();
    }
    return data;
  }
}

class Response {
  String accessToken;
  int expiresIn;
  String tokenType;
  String scope;
  String refreshToken;
  User user;
  String deviceToken;

  Response(
      {this.accessToken,
        this.expiresIn,
        this.tokenType,
        this.scope,
        this.refreshToken,
        this.user,
        this.deviceToken});

  Response.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    tokenType = json['token_type'];
    scope = json['scope'];
    refreshToken = json['refresh_token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    deviceToken = json['device_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    data['token_type'] = this.tokenType;
    data['scope'] = this.scope;
    data['refresh_token'] = this.refreshToken;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['device_token'] = this.deviceToken;
    return data;
  }
}

class User {
  ProfileImageUrls profileImageUrls;
  String id;
  String name;
  String account;
  String mailAddress;
  bool isPremium;
  bool isLogin;
  int xRestrict;
  bool isMailAuthorized;
  bool requirePolicyAgreement;

  User(
      {this.profileImageUrls,
        this.id,
        this.name,
        this.account,
        this.mailAddress,
        this.isPremium,
        this.isLogin,
        this.xRestrict,
        this.isMailAuthorized,
        this.requirePolicyAgreement});

  User.fromJson(Map<String, dynamic> json) {
    profileImageUrls = json['profile_image_urls'] != null
        ? new ProfileImageUrls.fromJson(json['profile_image_urls'])
        : null;
    id = json['id'];
    name = json['name'];
    account = json['account'];
    mailAddress = json['mail_address'];
    isPremium = json['is_premium'];
    isLogin = json['is_login'];
    xRestrict = json['x_restrict'];
    isMailAuthorized = json['is_mail_authorized'];
    requirePolicyAgreement = json['require_policy_agreement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profileImageUrls != null) {
      data['profile_image_urls'] = this.profileImageUrls.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['account'] = this.account;
    data['mail_address'] = this.mailAddress;
    data['is_premium'] = this.isPremium;
    data['is_login'] = this.isLogin;
    data['x_restrict'] = this.xRestrict;
    data['is_mail_authorized'] = this.isMailAuthorized;
    data['require_policy_agreement'] = this.requirePolicyAgreement;
    return data;
  }
}

class ProfileImageUrls {
  String px16x16;
  String px50x50;
  String px170x170;

  ProfileImageUrls({this.px16x16, this.px50x50, this.px170x170});

  ProfileImageUrls.fromJson(Map<String, dynamic> json) {
    px16x16 = json['px_16x16'];
    px50x50 = json['px_50x50'];
    px170x170 = json['px_170x170'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['px_16x16'] = this.px16x16;
    data['px_50x50'] = this.px50x50;
    data['px_170x170'] = this.px170x170;
    return data;
  }
}