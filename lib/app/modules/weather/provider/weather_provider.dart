import 'package:get/get.dart';
import 'package:weather_app/app/data/constants/app_url.dart';
import 'package:weather_app/app/data/enums.dart';
import 'package:weather_app/app/utils/url_util.dart';

class WeatherProvider extends GetConnect {
  static WeatherProvider get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = AppUrl.baseUrl;
    super.onInit();
  }

  Future<Response<dynamic>> getWeather(
      {UnitOptions unit = UnitOptions.m}) async {
    Response<dynamic> data = await get(
      UrlUtil.getPath(
        path: 'current',
        pathQuery: <String, String>{
          'units': unit.name,
        },
      ),
    );
    return data;
  }
}
