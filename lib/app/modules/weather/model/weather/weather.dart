import 'package:freezed_annotation/freezed_annotation.dart';

import 'current.dart';
import 'location.dart';
import 'request.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  factory Weather({
    Request? request,
    Location? location,
    Current? current,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
