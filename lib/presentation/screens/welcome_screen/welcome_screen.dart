import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_wise_app/data/models/objects/user_session.dart';

import '../../../core/themes/defaults.dart';
import '../../../logic/bloc/login/login_bloc.dart';
import '../../../logic/cubit/session/session_cubit.dart';
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
        } else if (state is LoginSuccess) {
          //login success,
          //add session
          context.read<SessionCubit>().addProfile(UserSessionModel(
              state.userDetails.preferredUsername ?? 'tagudin, aries',
              state.userDetails.profileUrl != null
                  ? state.userDetails.profileUrl.toString()
                  : 'https://github.com/tagudin-aries'));
          //navigate to home
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
