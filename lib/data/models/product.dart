import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart'; // File này tự sinh ra. Không được sửa
part 'product.g.dart'; // File này tự sinh ra. Không được sửa

/*
  Ví dụ tạo model bằng frezzed
*/
@Freezed(fromJson: true, toJson: true)
class Product with _$Product {
  const factory Product({
    @JsonKey(name: "Price") double? price,
    @JsonKey(name: "Quantity") int? quantity,
    @JsonKey(name: "ProductName") String? productName,
    String? imagePath,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}
