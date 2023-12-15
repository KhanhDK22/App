

import 'package:app_food_new/network/dio/base_network.dart';
import 'package:app_food_new/network/response/data_response.dart';

abstract class IAuthenRepository extends BaseNetwork {
  Future<DataResponse> login(
      {required String password, required String userName});
}
