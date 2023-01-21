part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
  @override
  List<Object?> get props => [];
}

class LoginSubmitted extends LoginState {
  const LoginSubmitted();
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  final UserProfile userDetails;

  const LoginSuccess(this.userDetails);
  @override
  List<Object?> get props => [userDetails];
}

class LoginFailed extends LoginState {
  const LoginFailed();
  @override
  List<Object?> get props => [];
}
