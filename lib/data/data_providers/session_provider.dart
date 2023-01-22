import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_wise_app/data/models/objects/user_session.dart';

abstract class ISessionProvider {
  void clearSession();
  Future<void> addProfile(UserSessionModel profile);
  Future<UserSessionModel?> fetchProfile();
  Future<bool> fetchFirstOpen();
  void updateFirstOpen();
}

class SessionProvider implements ISessionProvider {
  @override
  Future<void> addProfile(UserSessionModel profile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('preferredUsername', profile.preferredUsername);
    await prefs.setString('profileUrl', profile.profileUrl);
  }

  @override
  void clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('preferredUsername', "");
    await prefs.setString('profileUrl', "");
  }

  @override
  Future<UserSessionModel?> fetchProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? preferredUsername = prefs.getString('preferredUsername');
    String? profileUrl = prefs.getString('profileUrl');

    if ((preferredUsername == null || preferredUsername == '') ||
        (profileUrl == null || profileUrl == '')) {
      return null;
    } else {
      return UserSessionModel(preferredUsername, profileUrl);
    }
  }

  @override
  Future<bool> fetchFirstOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstOpen = prefs.getBool('firstOpen');

    if ((firstOpen == null)) {
      return true;
    } else {
      return firstOpen;
    }
  }

  @override
  void updateFirstOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('firstOpen', false);
  }
}
