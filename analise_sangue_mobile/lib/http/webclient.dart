import 'package:analise_sangue_mobile/http/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';

class WebClient {

  static const String baseUrl = 'seuip:porta';

  static final Dio client = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(minutes: 1)
    )
  );

  static final Dio clientAuth = Dio(
      BaseOptions(
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(minutes: 1)
      ),
  )..interceptors.add(AuthInterceptor());
}