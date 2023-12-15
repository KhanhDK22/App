import 'dart:io';

import 'package:app_food_new/config/server.dart';
import 'package:app_food_new/network/interceptor.dart';
import 'package:app_food_new/network/requests/request.dart';
import 'package:dio/dio.dart';

class DioClent {
  String? server;
  String? contentType;
  Dio _dioClient = Dio();
  DioClent({this.server, this.contentType})
  /*
      Config default option for a request
  */
  {
    {
      final options = BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        baseUrl: server ?? AppServer.serverUrl,
        contentType: contentType ?? ContentType.json.toString(),
      );
      _dioClient = Dio(options);
      _dioClient.interceptors.add(AppInterceptor());
    }
  }

  Future<dynamic> makeRequest({required NetworkRequest networkRequest}) async {
    // Get data from payload
    dynamic data = networkRequest.payload?.when(
      json: (json) => json,
      upload: (file) => file,
    );

    final response = (
      await _dioClient.request(
        data: data,
        networkRequest.endPoint,
        queryParameters: networkRequest.parameter,
        options: Options(
          method: networkRequest.method.name,
          contentType: networkRequest.contentType,
        ),
      ),
    );
    return response;
  }
}
