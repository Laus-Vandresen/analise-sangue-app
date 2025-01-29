import 'package:dio/dio.dart';

class WebClient {
  static final Dio client = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(minutes: 1)
    )
  );
}