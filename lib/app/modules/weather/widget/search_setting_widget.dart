import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/weather/controllers/weather_controller.dart';
import 'package:weather_app/app/modules/weather/model/country/country.dart';
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
            const SizedBox(height: 8),
            SizedBox(
              height: 36,
              child: TextEditBox(
                textController: controller.countryTextController,
                hintText: 'Country',
                isEnabled: controller.shouldCollectLocationFromIp.isFalse,
                autofillHints: controller.countries
                    .map((Country country) => country.name?.common ?? '')
                    .toList(),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 36,
              child: TextEditBox(
                textController: controller.cityTextController,
                hintText: 'City',
                isEnabled: controller.shouldCollectLocationFromIp.isFalse,
              ),
            ),
            const SizedBox(height: 8),
            SettingToggle(
                isChecked: controller.shouldCollectLocationFromIp.value,
                title: 'Collect location from IP',
                onChange: () =>
                    controller.shouldCollectLocationFromIp.toggle()),
            const SizedBox(height: 8),
            SettingToggle(
              isChecked: controller.isMetric.value,
              title: controller.isMetric.value ? 'Metric' : 'Imperial',
              onChange: () => controller.isMetric.toggle(),
            ),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () async {
                  if (controller.shouldCollectLocationFromIp.isTrue ||
                      (controller.countryTextController.text.isNotEmpty &&
                          controller.cityTextController.text.isNotEmpty)) {
                    await controller.fetchWeather();
                  } else {
                    Get.snackbar(
                      'Error',
                      'Please fill in the fields',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent.shade100,
                      colorText: Colors.white,
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom + 16,
                        left: 16,
                        right: 16,
                      ),
                    );
                  }
                },
                child: const Text('Search'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
