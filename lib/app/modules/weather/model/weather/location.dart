// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  factory Location({
    String? name,
    String? country,
    String? region,
    String? lat,
    String? lon,
    @JsonKey(name: 'timezone_id') String? timezoneId,
    DateTime? localtime,
    @JsonKey(name: 'localtime_epoch') int? localtimeEpoch,
    @JsonKey(name: 'utc_offset') String? utcOffset,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
