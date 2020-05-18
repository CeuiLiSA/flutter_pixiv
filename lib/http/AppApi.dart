import 'package:dio/dio.dart';

import 'PixivHeader.dart';
import 'TokenInt.dart';

class AppApi {


  static Future<Response> getHotTags(String token){
    Manager manager = Manager.instance;
    PixivHeader header = PixivHeader();
    manager._dio.options.headers = {
    "User-Agent": "PixivAndroidApp/5.0.175 (Android 6.0.1; D6653)",
    "Accept-Language": "zh_CN",
    "X-Client-Time": header.XClientTime,
    "X-Client-Hash": header.XClientHash,
    "Authorization": "Bearer " + token,
    };
    return manager._dio.get("v1/trending-tags/illust?filter=for_android&include_translated_tag_results=true");
  }


  static Future<Response> getRecmdUser(String token){
    Manager manager = Manager.instance;
    PixivHeader header = PixivHeader();
    manager._dio.options.headers = {
      "User-Agent": "PixivAndroidApp/5.0.175 (Android 6.0.1; D6653)",
      "Accept-Language": "zh_CN",
      "X-Client-Time": header.XClientTime,
      "X-Client-Hash": header.XClientHash,
      "Authorization": "Bearer " + token,
    };
    return manager._dio.get("v1/user/recommended?filter=for_android");
  }
}

class Manager {

  factory Manager() => _getInstance();

  String API_BASE_URL = "https://app-api.pixiv.net/";

  Dio _dio;

  static Manager get instance => _getInstance();
  static Manager _instance;

  Dio getDio(){
    return _dio;
  }

  Manager._internal() {
    print("Manager dio 构造了一次：");

    BaseOptions options = BaseOptions(
        baseUrl: API_BASE_URL,
        responseType: ResponseType.plain,
    );

    _dio = Dio(options);
    _dio.interceptors.add(LogInterceptor(error: true, responseBody: true));
    _dio.interceptors.add(TokenInt());
  }

  static Manager _getInstance() {
    if (_instance == null) {
      _instance = new Manager._internal();
    }
    return _instance;
  }
}
