import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/weather/controllers/weather_controller.dart';
import 'package:weather_app/app/modules/weather/widget/search_setting_widget.dart';
import 'package:weather_app/app/modules/weather/widget/weather_card.dart';

class WeatherPortraitView extends StatelessWidget {
  const WeatherPortraitView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WeatherController controller;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await controller.fetchWeather(),
      child: SizedBox(
        height: Get.height,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: Column(
              children: <Widget>[
                WeatherCard(weather: controller.state!, width: Get.width),
                Divider(thickness: 2, height: 32, color: Colors.grey.shade300),
                SearchSettingWidget(
                  controller: controller,
                  width: Get.width,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
