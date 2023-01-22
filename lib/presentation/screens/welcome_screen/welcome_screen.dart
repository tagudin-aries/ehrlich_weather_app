import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/themes/defaults.dart';
import '../../../logic/bloc/login/login_bloc.dart';
import '../../shared/popups/custom_popup.dart';
import '../home_screen/home_screen.dart';
import 'widgets/content.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const routeName = 'welcome';

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSubmitted) {
          //login in-progress
          //normally would show loading. no need here since this is using auth0 redirection
        } else if (state is LoginFailed) {
          //show error popup
          CustomPopup.show(
              context: context,
              from: "Login",
              msg: 'Login failed or cancelled by the user',
              type: CoolAlertType.error);
        } else {
          //login success, navigate to home
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
            padding: EdgeInsets.all(ThemeDefaults.tDefaultPaddingSize),
            child: WelcomeContent()),
      ),
    );
  }
}
