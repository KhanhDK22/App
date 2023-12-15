import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart'; // File này tự sinh ra. Không được sửa
part 'user.g.dart'; // File này tự sinh ra. Không được sửa

/*
  Ví dụ tạo model bằng frezzed
*/
@Freezed(fromJson: true, toJson: true)
class User with _$User {
  const factory User({
    @JsonKey(name: "UserName") required String userName,
    @JsonKey(name: "Password") required String password,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
