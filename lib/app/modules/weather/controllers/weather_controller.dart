import 'package:get/get.dart';
import 'package:weather_app/app/modules/weather/model/weather/weather.dart';
import 'package:weather_app/app/modules/weather/provider/weather_provider.dart';

class WeatherController extends GetxController with StateMixin<Weather> {
  WeatherController({required this.provider});
  final WeatherProvider provider;

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
