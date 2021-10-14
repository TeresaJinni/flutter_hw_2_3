import 'package:dio/dio.dart';

Dio initDio() {
    // 声明 Dio 的配置项
  BaseOptions _baseOptions = BaseOptions(
    baseUrl: "http://rap2api.taobao.org/app/mock/255557/api/v1", // 接口请求地址
    connectTimeout: 5000, // 请求服务器的超时时间
  );
  
  Dio dio = Dio(_baseOptions); // 初始化

  // 添加拦截器
  dio.interceptors.add(InterceptorsWrapper(
    // 请求拦截
    onRequest:(options, handler){
      // 请求开始之前，做一些处理
      return handler.next(options); //continue
    },
    // 响应拦截
    onResponse:(response,handler) {
      // 对响应数据进行处理
      return handler.next(response); // continue
    },
    // 报错拦截
    onError: (DioError e, handler) {
      // 对响应报错进行处理
      return  handler.next(e);//continue 
    }
  ));

  // 返回 dio
  return dio;
}