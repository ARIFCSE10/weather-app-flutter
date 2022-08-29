// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'current.freezed.dart';
part 'current.g.dart';

@freezed
class Current with _$Current {
  factory Current({
    @JsonKey(name: 'observation_time') String? observationTime,
    double? temperature,
    @JsonKey(name: 'weather_code') double? weatherCode,
    @JsonKey(name: 'weather_icons') List<String>? weatherIcons,
    @JsonKey(name: 'weather_descriptions') List<String>? weatherDescriptions,
    @JsonKey(name: 'wind_speed') double? windSpeed,
    @JsonKey(name: 'wind_degree') double? windDegree,
    @JsonKey(name: 'wind_dir') String? windDir,
    double? pressure,
    double? precip,
    double? humidity,
    double? cloudcover,
    double? feelslike,
    @JsonKey(name: 'uv_index') double? uvIndex,
    double? visibility,
    @JsonKey(name: 'is_day') String? isDay,
  }) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}
