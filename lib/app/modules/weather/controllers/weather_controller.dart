import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/weather/model/weather/weather.dart';
import 'package:weather_app/app/modules/weather/provider/weather_provider.dart';

class WeatherController extends GetxController with StateMixin<Weather> {
  WeatherController({required this.provider});
  static WeatherController get to => Get.find();
  final WeatherProvider provider;
  final TextEditingController countryTextController = TextEditingController();
  final TextEditingController cityTextController = TextEditingController();
  RxBool shouldCollectLocationFromIp = false.obs;
  RxBool isMetric = true.obs;

  @override
  void onInit() {
    fetchWeather();
    super.onInit();
  }

  Future<void> fetchWeather() async {
    change(null, status: RxStatus.loading());
    await Future.delayed(1.seconds);
    // change(null, status: RxStatus.error('hello error'));
    // change(Weather(), status: RxStatus.success());

    Response<dynamic> response = await provider.getWeather();

    try {
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
