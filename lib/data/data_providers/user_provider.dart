import 'package:auth0_flutter/auth0_flutter.dart';

class UserProvider {
  final Auth0 auth0Config;
  UserProvider(this.auth0Config);

  Future<Credentials> sendLoginRequest() async {
    return auth0Config
        .webAuthentication(scheme: 'app')
        .login()
        .then((value) => value);
  }

  Future<void> sendLogoutRequest() async {
    return auth0Config.webAuthentication(scheme: 'app').logout();
  }
}
