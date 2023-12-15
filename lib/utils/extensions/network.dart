// Định nghĩa dữ liệu tương ứng với trạng thái thành công và thất bại của response
import 'package:app_food_new/network/response/data_response.dart';

typedef WhenSuccess<T> = Function(T success);
typedef WhenFaild<String> = Function(String error);

extension NetworkExtension<T> on DataResponse<T> {
  bool get isSuccess => this is ResponseSuccess<T>;

  dynamic on({
    required WhenSuccess whenSuccess,
    required WhenFaild whenFaild,
  }) {
    if (isSuccess) {
      return whenSuccess.call(ResponseSuccess(dataModel));
    }
    return whenFaild.call(ResponseFaild(errorMessage));
  }
}
