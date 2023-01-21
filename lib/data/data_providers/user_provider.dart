import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/foundation.dart';

class UserProvider {
  final Auth0 auth0Config;
  UserProvider(this.auth0Config);

  Future<Credentials> sendLoginRequest() async {
    final credentials =
        await auth0Config.webAuthentication(scheme: 'app').login();

    return credentials;
  }
}
