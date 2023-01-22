import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  IUserRepository repo;

  LoginBloc(this.repo) : super(LoginInitial()) {
    on<LogingInEvent>((event, emit) {
      doSignIn();
      emit(const LoginSubmitted());
    });

    on<LoginDoneEvent>((event, emit) {
      if (event.response.accessToken.length != 0) {
        emit(LoginSuccess(event.response.user));
      } else {
        emit(LoginFailed());
      }
    });

    on<LogoutEvent>((event, emit) {
      print("yes");
      doLogout();
      emit(const LogoutSubmitted());
    });

    on<LogoutDoneEvent>((event, emit) {
      emit(LogoutSuccess());
    });
  }

  void doSignIn() async {
    add(LoginDoneEvent(await repo.login()));
  }

  void doLogout() async {
    await repo.logout().then((_) {
      add(LogoutDoneEvent());
    });
  }
}
