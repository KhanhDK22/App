import 'package:equatable/equatable.dart';

abstract class AuthenEvent extends Equatable {}

class LoginEvent extends AuthenEvent {
  final String userName;
  final String password;
  LoginEvent({required this.userName, required this.password});
  @override
  List<Object?> get props => [userName, password];
}
