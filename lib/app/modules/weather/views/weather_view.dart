import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/weather/views/orientation/landscape.dart';
import 'package:weather_app/app/modules/weather/views/orientation/portrait.dart';
import 'package:weather_app/app/modules/weather/widget/loader_widget.dart';
import 'package:weather_app/app/modules/weather/widget/response_error_widget.dart';

import '../controllers/weather_controller.dart';

class WeatherView extends GetView<WeatherController> {
  const WeatherView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Weather'),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: controller.obx(
        onLoading: const LoaderWidget(),
        onError: (error) => ResponseErrorWidget(
          onRetry: () => controller.fetchWeather(),
          error: error.toString(),
        ),
        (weather) => RefreshIndicator(
          onRefresh: () async => await controller.fetchWeather(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: OrientationBuilder(
                  builder: ((context, _) =>
                      (MediaQuery.of(context).orientation ==
                              Orientation.portrait)
                          ? WeatherPortraitView(
                              weather: weather!,
                            )
                          : WeatherLandscapeView(
                              weather: weather!,
                            )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
