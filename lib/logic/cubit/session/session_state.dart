part of 'session_cubit.dart';

class SessionState extends Equatable {
  final UserSessionModel session;
  const SessionState(this.session);

  @override
  List<Object> get props => [session];
}
