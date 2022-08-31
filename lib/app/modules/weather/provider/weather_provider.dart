import 'package:get/get.dart';
import 'package:weather_app/app/data/constants/app_url.dart';
import 'package:weather_app/app/modules/weather/model/weather_request.dart';
import 'package:weather_app/app/modules/weather/util/url_util.dart';

class WeatherProvider extends GetConnect {
  static WeatherProvider get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = AppUrl.weatherBaseUrl;
    super.onInit();
  }

  Future<Response<dynamic>> getWeather({
    required WeatherRequest request,
  }) async {
    Map<String, String> pathQuery = <String, String>{
      'units': request.unit.name,
    };
    if (!request.shouldCollectLocationFromIp) {
      pathQuery['query'] =
          '${request.city}${request.country.isNotEmpty == true ? ',' : ''}${request.country}';
    }

    Response<dynamic> data = await get(
      UrlUtil.getWeatherPath(
        path: 'current',
        pathQuery: pathQuery,
        useDefaultQuery: request.shouldCollectLocationFromIp,
      ),
    );
    return data;
  }
}
