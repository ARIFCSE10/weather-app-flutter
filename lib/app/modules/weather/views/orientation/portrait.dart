import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/weather/model/weather/weather.dart';
import 'package:weather_app/app/modules/weather/widget/weather_card.dart';

class WeatherPortraitView extends StatelessWidget {
  const WeatherPortraitView({Key? key, required this.weather})
      : super(key: key);
  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[WeatherCard(weather: weather, width: Get.width)],
    );
  }
}
