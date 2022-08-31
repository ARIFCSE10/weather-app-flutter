import 'package:get/get.dart';

import '../modules/weather/bindings/weather_binding.dart';
import '../modules/weather/views/weather_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.weather;

  static final routes = [
    GetPage(
      name: _Paths.weather,
      page: () => const WeatherView(),
      binding: WeatherBinding(),
    ),
  ];
}
