import 'package:equatable/equatable.dart';

abstract class AuthenState extends Equatable {}

class AuthenInit extends AuthenState {
  @override
  List<Object?> get props => [];
}

class Loading extends AuthenState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends AuthenState {
  @override
  List<Object?> get props => [];
}

class LoginFaild extends AuthenState {
  final String message;
  LoginFaild(this.message);
  @override
  List<Object?> get props => [message];
}
