import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/strings.dart';
import '../../../../logic/bloc/weather/weather_bloc.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.homeGreeting,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: Colors.grey.withOpacity(0.9)),
        ),
        Container(
          height: 10,
        ),
        Text(
          Strings.homeExploreCities,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(color: Colors.black, fontSize: 35),
        ),
        Container(
          height: 15,
        ),
        Container(
          decoration:
              const BoxDecoration(border: Border(left: BorderSide(width: 4))),
          padding:
              const EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                    onSubmitted: (value) => context
                        .read<WeatherBloc>()
                        .add(WeatherSearchEvent(value)),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(0),
                      label: Text(Strings.homeSearchText),
                      border: InputBorder.none,
                    ),
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.apply(color: Colors.black)),
              ),
              const Icon(Icons.search, size: 25),
            ],
          ),
        ),
      ],
    );
  }
}
