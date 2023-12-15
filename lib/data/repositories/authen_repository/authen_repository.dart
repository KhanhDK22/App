

import 'package:app_food_new/const/enum/method_request.dart';
import 'package:app_food_new/data/repositories/authen_repository/i_authen_repository.dart';
import 'package:app_food_new/network/requests/payloads/payload.dart';
import 'package:app_food_new/network/requests/request.dart';
import 'package:app_food_new/network/response/data_response.dart';

class AuthenRepository extends IAuthenRepository {
  @override
  Future<DataResponse> login(
      {required String password, required String userName}) {
    return excute(
      networkRequest: NetworkRequest(
          endPoint: "endPoint",
          method: MethodRequest.POST,
          payload: Payload.json({"UserName": userName, "Password": password})),
      parser: (parser) {},
    );
  }
}
