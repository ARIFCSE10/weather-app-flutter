import 'package:get/get.dart';
import 'package:weather_app/app/modules/weather/provider/weather_provider.dart';

import '../controllers/weather_controller.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherProvider>(
      () => WeatherProvider(),
    );

    Get.lazyPut<WeatherController>(
      () => WeatherController(provider: WeatherProvider.to),
    );
  }
}
