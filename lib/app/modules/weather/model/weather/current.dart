// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'current.freezed.dart';
part 'current.g.dart';

@freezed
class Current with _$Current {
  factory Current({
    @JsonKey(name: 'observation_time') String? observationTime,
    int? temperature,
    @JsonKey(name: 'weather_code') int? weatherCode,
    @JsonKey(name: 'weather_icons') List<String>? weatherIcons,
    @JsonKey(name: 'weather_descriptions') List<String>? weatherDescriptions,
    @JsonKey(name: 'wind_speed') int? windSpeed,
    @JsonKey(name: 'wind_degree') int? windDegree,
    @JsonKey(name: 'wind_dir') String? windDir,
    int? pressure,
    int? precip,
    int? humidity,
    int? cloudcover,
    int? feelslike,
    @JsonKey(name: 'uv_index') int? uvIndex,
    int? visibility,
    @JsonKey(name: 'is_day') String? isDay,
  }) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}
