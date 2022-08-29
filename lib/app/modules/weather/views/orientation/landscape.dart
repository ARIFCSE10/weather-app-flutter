import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/weather/controllers/weather_controller.dart';
import 'package:weather_app/app/modules/weather/widget/setting_toggle.dart';
import 'package:weather_app/app/modules/weather/widget/text_edit_box.dart';
import 'package:weather_app/app/modules/weather/widget/weather_card.dart';

class WeatherLandscapeView extends StatelessWidget {
  const WeatherLandscapeView({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final WeatherController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: Get.width / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Search settings',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  TextEditBox(
                    textController: controller.countryTextController,
                    hintText: 'Country',
                    isEnabled: controller.shouldCollectLocationFromIp.isTrue,
                  ),
                  const SizedBox(height: 8),
                  TextEditBox(
                    textController: controller.cityTextController,
                    hintText: 'City',
                    isEnabled: controller.shouldCollectLocationFromIp.isTrue,
                  ),
                  const SizedBox(height: 8),
                  SettingToggle(
                      isChecked: controller.isMetric.value,
                      title: 'Collect location from IP',
                      onChange: () {
                        controller.shouldCollectLocationFromIp.toggle();
                      }),
                  SettingToggle(
                    isChecked: false,
                    title: controller.isMetric.value ? 'Metric' : 'Imperial',
                    onChange: () => controller.isMetric.toggle(),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton(
                      onPressed: () => controller.fetchWeather(),
                      child: const Text('Search'),
                    ),
                  ),
                ],
              ),
            ),
            WeatherCard(weather: controller.state!, width: Get.height),
          ],
        ),
      ),
    );
  }
}
