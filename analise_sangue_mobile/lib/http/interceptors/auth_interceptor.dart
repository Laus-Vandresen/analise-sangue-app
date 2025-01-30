import 'package:analise_sangue_mobile/util/shared_preferences_util.dart';
import 'package:dio/dio.dart';

class AuthInterceptor implements Interceptor {

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await SharedPreferencesUtil().get('jwt');
    options.headers = {
      'content-type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }



}