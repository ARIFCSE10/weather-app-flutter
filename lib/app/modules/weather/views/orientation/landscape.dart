import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/weather/model/weather/weather.dart';
import 'package:weather_app/app/modules/weather/widget/weather_card.dart';

class WeatherLandscapeView extends StatelessWidget {
  const WeatherLandscapeView({Key? key, required this.weather})
      : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[WeatherCard(weather: weather, width: Get.height)],
      ),
    );
  }
}
