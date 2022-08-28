import 'package:weather_app/app/data/constants/app_url.dart';

class UrlUtil {
  UrlUtil._();

  static String getPath(
      {required String path, Map<String, String>? pathQuery}) {
    final StringBuffer sb = StringBuffer(path);
    if (pathQuery != null) {
      sb.write('?${AppUrl.accessKeyName}=${AppUrl.accessKeyValue}&');
      pathQuery.forEach((key, value) {
        sb.write('$key=$value&');
      });
      sb.write('${AppUrl.queryKeyName}=${AppUrl.queryKeyValue}');
    }
    return sb.toString();
  }
}
