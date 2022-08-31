import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/weather/controllers/weather_controller.dart';
import 'package:weather_app/app/modules/weather/widget/search_setting_widget.dart';
import 'package:weather_app/app/modules/weather/widget/weather_card.dart';

class WeatherLandscapeView extends StatelessWidget {
  const WeatherLandscapeView({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final WeatherController controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: Get.height,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                WeatherCard(weather: controller.state!, width: Get.height),
                SearchSettingWidget(
                  controller: controller,
                  width: Get.width / 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
