import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:repair_app/utils/local_storage.dart';


class ClientApi {
  Future<Dio> getClient() async {
    Dio dio = Dio(getOptions(await LocalStorage().getTokenFromDisk));

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio;
  }
}

BaseOptions getOptions(String? token) {
  return BaseOptions(
    baseUrl: 'http://192.168.1.205/RAS/api/',
    connectTimeout: 15000,
    receiveTimeout: 15000,
    headers: {
      'token': token,
      "user-type-code": "INDUSTRIALIST",
      "Accept": "application/json",
      'Content-Type': 'application/json'
    },
  );
}