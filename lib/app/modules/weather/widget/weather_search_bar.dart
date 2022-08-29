import 'package:flutter/material.dart';
import 'package:weather_app/app/modules/weather/widget/search_field.dart';

class WeatherSearchBar extends StatefulWidget {
  const WeatherSearchBar({Key? key}) : super(key: key);

  @override
  State<WeatherSearchBar> createState() => _WeatherSearchBarState();
}

class _WeatherSearchBarState extends State<WeatherSearchBar> {
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SafeArea(
      child: isPortrait
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SearchField(),
                Row(
                  children: const <Widget>[
                    Text('Search by country'),
                  ],
                )
              ],
            )
          : Row(
              children: const <Widget>[
                Expanded(
                  child: SearchField(),
                ),
              ],
            ),
    );
  }
}
