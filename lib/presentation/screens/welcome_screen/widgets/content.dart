import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/bloc/login/login_bloc.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(
            image: AssetImage('lib/assets/images/welcome/welcome_sunny.png'),
            height: 400 * 0.6),
        Column(
          children: [
            Text('Weather at Your Fingertips!',
                style: Theme.of(context).textTheme.headline3),
            Text(
                'Never be caught off guard by the weather again with our comprehensive and reliable forecast app.',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(20)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black)),
                onPressed: () => context.read<LoginBloc>().add(LogingInEvent()),
                child: Text('LOGIN WITH GITHUB ACCOUNT'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
