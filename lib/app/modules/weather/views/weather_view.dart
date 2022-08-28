import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/modules/weather/widget/loader_widget.dart';
import 'package:weather_app/app/modules/weather/widget/response_error_widget.dart';

import '../controllers/weather_controller.dart';

class WeatherView extends GetView<WeatherController> {
  const WeatherView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.fetchWeather();
        },
        child: controller.obx(
          (weather) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Text(
              weather.toString(),
            ),
          ),
          onLoading: const LoaderWidget(),
          onError: (error) => ResponseErrorWidget(
            onRetry: () => controller.fetchWeather(),
          ),
        ),
      ),
    );
  }
}
