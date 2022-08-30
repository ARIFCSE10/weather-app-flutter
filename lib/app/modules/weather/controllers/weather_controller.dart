import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/data/enums.dart';
import 'package:weather_app/app/modules/weather/model/weather/weather.dart';
import 'package:weather_app/app/modules/weather/provider/weather_provider.dart';

class WeatherController extends GetxController with StateMixin<Weather> {
  WeatherController({required this.provider});
  static WeatherController get to => Get.find();
  final WeatherProvider provider;
  final TextEditingController countryTextController = TextEditingController();
  final TextEditingController cityTextController = TextEditingController();

  RxBool shouldCollectLocationFromIp = true.obs;
  RxBool isMetric = true.obs;
  RxBool showSearchSettings = false.obs;

  @override
  void onInit() {
    fetchWeather();
    super.onInit();
  }

  Future<void> fetchWeather() async {
    change(null, status: RxStatus.loading());
    await Future.delayed(1.seconds);
    // change(null, status: RxStatus.error('Something went wrong'));
    change(Weather(), status: RxStatus.success());

    try {
      Response<dynamic> response = await provider.getWeather(
        unit: isMetric.value ? UnitOptions.m : UnitOptions.f,
        city: cityTextController.text.trim(),
        country: countryTextController.text.trim(),
        shouldCollectLocationFromIp: shouldCollectLocationFromIp.value,
      );

      if (response.body['success'] == false) {
        change(null, status: RxStatus.error());
      } else {
        Weather weather = Weather.fromJson(response.body);
        change(weather, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
