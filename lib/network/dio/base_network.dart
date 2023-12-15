

import 'package:app_food_new/const/message/network_error_message.dart';
import 'package:app_food_new/network/dio/dio_client.dart';
import 'package:app_food_new/network/requests/request.dart';
import 'package:app_food_new/network/response/data_response.dart';
import 'package:app_food_new/network/service.dart';
import 'package:app_food_new/utils/log.dart';
import 'package:dio/dio.dart';

class BaseNetwork {
  /*
    create a request with inputs which are data of networkRequest,
    when request success then use method parser to parse into model
  */
  Future<DataResponse<T>> excute<T>({
    required NetworkRequest networkRequest,
    required T Function(dynamic) parser,
  }) async {
    final dioClient = DioClent();

    try {
      var response =
          await dioClient.makeRequest(networkRequest: networkRequest);
      return ResponseSuccess(parser.call(response));
    } catch (e, s) {
      logDebug(e);
      logDebug(s);
      if (e is DioException) {
        logDebug("============");
        logDebug(e.response?.statusCode);
        logDebug(e.response?.data.toString());
        String msg = e.response?.data ?? "";
        if (msg.isEmpty) {
          return ResponseFaild(NetworkService.handleExeption(e));
        }
        return ResponseFaild(e.response?.data.toString() ?? "");
      }
      return ResponseFaild(ErrorMessage.unknown);
    }
  }
}
