import 'package:app_food_new/network/dio/base_network.dart';
import 'package:app_food_new/network/response/data_response.dart';

import '../../models/product.dart';

abstract class IProductRepository extends BaseNetwork {
  Future<DataResponse<List<Product>>> getAll();
  Future<DataResponse> create(Product product);
}
