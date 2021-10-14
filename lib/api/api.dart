// API.dart
import 'package:dio/dio.dart';

import 'init_dio.dart';
import 'home_api.dart';
// import 'ProductAPI.dart';
// import 'CategoryAPI.dart';
import '../api/user_api.dart';
import 'shop_api.dart';

class API {
  Dio _dio = initDio();

  API() {
    // _dio = initDio();
  }

  /// 首页接口
  // get home 函数，可以像属性一样访问 api.home.getSlide()
  // => 简化写法，可以不写return，相当于 return new HomeAPI(_dio)
  HomeAPI get home => HomeAPI(_dio);  
  
  /// 门店接口
  ShopAPI get shop => ShopAPI(_dio);

  /// 商品接口
  // ProductAPI get product => ProductAPI(_dio);

  /// 商品分类
  // CategoryAPI get category => CategoryAPI(_dio);

  /// 用户接口
  UserAPI get user => UserAPI(_dio);
}