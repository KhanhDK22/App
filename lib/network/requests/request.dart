import 'package:app_food_new/const/enum/method_request.dart';
import 'package:app_food_new/network/requests/payloads/payload.dart';

class NetworkRequest {
  String endPoint;
  Payload? payload;
  String? contentType;
  MethodRequest method;
  Map<String, dynamic>? parameter;
  NetworkRequest({
    this.payload,
    this.parameter,
    this.contentType,
    required this.endPoint,
    required this.method,
  });
}
