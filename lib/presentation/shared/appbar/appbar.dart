import 'package:flutter/material.dart';

import '../../../core/constants/strings.dart';
import 'profile_action.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      leading: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 5, left: 5),
        child: Image(
          width: 20,
          height: 20,
          image: AssetImage('lib/assets/images/logos/logo.png'),
        ),
      ),
      title: Text(Strings.appTitle,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.black)),
      actions: [ProfileAction()],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 60);
}
