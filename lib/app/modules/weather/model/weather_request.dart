import 'package:weather_app/app/data/enums.dart';

class WeatherRequest {
  final bool shouldCollectLocationFromIp;
  final String city;
  final String country;
  final UnitOptions unit;

  WeatherRequest({
    required this.shouldCollectLocationFromIp,
    required this.city,
    required this.country,
    required this.unit,
  });
}
