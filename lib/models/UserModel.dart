import 'Beans.dart';

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