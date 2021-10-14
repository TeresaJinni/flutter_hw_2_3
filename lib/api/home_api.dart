// HomeAPI.dart
import 'package:dio/dio.dart';

class HomeAPI {
  final Dio _dio;

  HomeAPI(this._dio);  // 构造函数，this._dio 传参 赋值

  /// 轮播图列表
  /// 异步返回必须是Future
  Future<dynamic> getSlide() async {
    Response res = await _dio.get('/home/slide');
    print(" -- 轮播图接口 被调用--");

    return res.data;
  }

  /// 门店列表
  Future<dynamic> getShopList({
    String geohash = '120.22323,36.23554', 
    int page = 1, 
    int limit = 10
  }) async {
    Response res = await _dio.get('/shop/list',
      queryParameters: {
        'geohash': geohash,
        'page': page,
        'limit': limit,
      }
    );
    
    return res.data;
  }
}