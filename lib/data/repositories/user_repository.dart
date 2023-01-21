import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../data_providers/user_provider.dart';

abstract class IUserRepository {
  Future<Credentials> login();
}

class UserRepository implements IUserRepository {
  late UserProvider userProvider;
  UserRepository() {
    final Auth0 auth0 =
        Auth0(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);
    userProvider = UserProvider(auth0);
  }

  @override
  Future<Credentials> login() {
    return userProvider.sendLoginRequest();
  }
}
