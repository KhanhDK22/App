import 'package:app_food_new/const/enum/method_request.dart';
import 'package:app_food_new/data/models/product.dart';
import 'package:app_food_new/data/repositories/product_repository/i_product_repository.dart';
import 'package:app_food_new/network/requests/payloads/payload.dart';
import 'package:app_food_new/network/requests/request.dart';
import 'package:app_food_new/network/response/data_response.dart';

class ProductRepository extends IProductRepository {
  @override
  Future<DataResponse<List<Product>>> getAll() async {
    return await excute(
      networkRequest: NetworkRequest(
        endPoint: "Here is endpoint url",
        method: MethodRequest.GET,
      ),
      /*
        parser trả về dữ liệu dynamic. Thực hiện ép kiểu dynamic sang list và dùng map để duyệt từn phần tử say đó dùng  Product.fromJson để chuyển về kiểu Product
      */
      parser: (data) => (data as List).map((e) => Product.fromJson(e)).toList(),
    );
  }

  @override
  Future<DataResponse> create(Product product) async {
    return await excute(
      networkRequest: NetworkRequest(
          endPoint: "Here is endpoint url",
          method: MethodRequest.POST,
          // vì BE và mobile giao tiếp qua api nên dữ liệu phải chuyển sang dạng json
          payload: Payload.json(product.toJson())),
      /*
        parser trả về dữ liệu dynamic. Thực hiện ép kiểu dynamic sang list và dùng map để duyệt từn phần tử say đó dùng  Product.fromJson để chuyển về kiểu Product
      */
      parser: (data) {},
    );
  }
}
