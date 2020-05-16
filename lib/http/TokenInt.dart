import 'package:dio/dio.dart';
import 'package:flutterpixiv/http/AppApi.dart';

import 'LoginApi.dart';

class TokenInt with Interceptor{

  static final String token_error = "Error occurred at the OAuth process";

  @override
  Future onError(DioError err) async {
    String errorString = err.response.data.toString();
    print("TokenInt onError " + errorString);
    if(err.response.statusCode == 400 && errorString.contains(token_error)) {

      String newToken = await Login().getNewToken();

      var request = err.response.request;

      Dio dio = Manager.instance.getDio();//创建新的Dio实例
      dio.options.headers['Authorization'] = newToken;

      try {
        var newRequest = await dio.request(request.path);
        return newRequest;
      } on DioError catch (e) {
        return e;
      }
    }
    return super.onError(err);
  }

  @override
  Future onRequest(RequestOptions options) {
    print("TokenInt onRequest");
    return super.onRequest(options);
  }


  @override
  Future onResponse(Response response) {
    print("TokenInt onResponse");
    return super.onResponse(response);
  }
}