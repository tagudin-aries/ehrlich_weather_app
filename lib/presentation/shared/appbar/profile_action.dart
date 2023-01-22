import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_wise_app/logic/bloc/login/login_bloc.dart';
import 'package:weather_wise_app/logic/cubit/session/session_cubit.dart';

class ProfileAction extends StatelessWidget {
  const ProfileAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      padding: const EdgeInsets.all(0),
      position: PopupMenuPosition.under,
      itemBuilder: (context) => [
        // PopupMenuItem 1
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          value: 1,
          // row with 2 children
          child: Card(
            color: Theme.of(context).primaryColor,
            child: Container(
              width: 250,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: BlocBuilder<SessionCubit, SessionState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            state.session.preferredUsername,
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(Icons.web),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 195,
                            child: Text(
                              state.session.profileUrl,
                              style: Theme.of(context).textTheme.bodyText1,
                              maxLines: 2,
                              softWrap: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        // PopupMenuItem 2
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          value: 2,
          // row with two children
          child: Card(
            color: Colors.white,
            child: Container(
              width: 250,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<LoginBloc>().add(LogoutEvent());
                          context.read<SessionCubit>().clearSession();
                        },
                        child: Text(
                          "Logout",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      child: Container(
        padding: const EdgeInsets.all(13),
        margin: const EdgeInsets.only(right: 20, top: 7),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //For Dark Color
          color: Color(0xFFB8E7FB),
        ),
        child: ImageIcon(
          AssetImage('lib/assets/images/shared/user.png'),
          color: Color(0xFF6BC5F5),
        ),
      ),
    );
  }
}
