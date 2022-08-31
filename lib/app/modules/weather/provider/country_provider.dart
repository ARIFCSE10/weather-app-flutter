import 'package:get/get.dart';
import 'package:weather_app/app/data/constants/app_url.dart';
import 'package:weather_app/app/modules/weather/model/country/country.dart';

class CountryProvider extends GetConnect {
  static CountryProvider get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = AppUrl.countryBaseUrl;
    super.onInit();
  }

  Future<List<Country>> getCountries() async {
    try {
      Response<dynamic> data = await get('all?fields=name,flag');
      if (data.statusCode != 200) {
        return [];
      }
      return List.from(data.body).map((e) => Country.fromJson(e)).toList();
    } catch (_) {
      return [];
    }
  }
}
