part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LogingInEvent extends LoginEvent {
  const LogingInEvent();

  @override
  List<Object> get props => [];
}

class LoginDoneEvent extends LoginEvent {
  const LoginDoneEvent(this.response);

  final Credentials response;

  @override
  List<Object> get props => [response];
}

class LogoutEvent extends LoginEvent {
  const LogoutEvent();

  @override
  List<Object> get props => [];
}

class LogoutDoneEvent extends LoginEvent {
  const LogoutDoneEvent();

  @override
  List<Object> get props => [];
}
