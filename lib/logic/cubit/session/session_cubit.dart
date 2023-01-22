import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_wise_app/data/models/objects/user_session.dart';

import '../../../data/data_providers/session_provider.dart';

part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(SessionState(UserSessionModel('', '')));

  final ISessionProvider _sessionProvider = SessionProvider();

  void fetchSession() async {
    UserSessionModel? session = await _sessionProvider.fetchProfile();
    emit(SessionState(session ?? UserSessionModel('', '')));
  }

  Future<void> addProfile(UserSessionModel session) async {
    await _sessionProvider.addProfile(session);
    emit(SessionState(session));
  }

  Future<bool> hasSession() async {
    UserSessionModel? session = await _sessionProvider.fetchProfile();

    return session != null;
  }

  Future<bool> isFirstOpen() async {
    return await _sessionProvider.fetchFirstOpen();
  }

  void updateFirstOpen() async {
    _sessionProvider.updateFirstOpen();
  }

  void clearSession() {
    _sessionProvider.clearSession();
    emit(SessionState(UserSessionModel('', '')));
  }
}
