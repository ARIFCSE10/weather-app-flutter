import 'package:weather_app/app/data/constants/app_url.dart';

class UrlUtil {
  UrlUtil._();

  static String getWeatherPath({
    required String path,
    Map<String, String>? pathQuery,
    bool useDefaultQuery = true,
  }) {
    final StringBuffer sb = StringBuffer(path);
    if (pathQuery != null) {
      sb.write('?${AppUrl.accessKeyName}=${AppUrl.accessKeyValue}');
      pathQuery.forEach((key, value) {
        sb.write('&$key=$value');
      });
      if (useDefaultQuery) {
        sb.write('&${AppUrl.queryKeyName}=${AppUrl.queryKeyDefaultValue}');
      }
    }
    return sb.toString();
  }
}
