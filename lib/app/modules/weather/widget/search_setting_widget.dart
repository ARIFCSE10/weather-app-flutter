import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/weather/controllers/weather_controller.dart';
import 'package:weather_app/app/modules/weather/widget/setting_toggle.dart';
import 'package:weather_app/app/modules/weather/widget/text_edit_box.dart';

class SearchSettingWidget extends StatelessWidget {
  const SearchSettingWidget({
    Key? key,
    required this.controller,
    required this.width,
  }) : super(key: key);
  final WeatherController controller;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Search settings',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextEditBox(
              textController: controller.countryTextController,
              hintText: 'Country',
              isEnabled: controller.shouldCollectLocationFromIp.isFalse,
            ),
            const SizedBox(height: 8),
            TextEditBox(
              textController: controller.cityTextController,
              hintText: 'City',
              isEnabled: controller.shouldCollectLocationFromIp.isFalse,
            ),
            const SizedBox(height: 8),
            SettingToggle(
                isChecked: controller.shouldCollectLocationFromIp.value,
                title: 'Collect location from IP',
                onChange: () =>
                    controller.shouldCollectLocationFromIp.toggle()),
            SettingToggle(
              isChecked: controller.isMetric.value,
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
    );
  }
}
