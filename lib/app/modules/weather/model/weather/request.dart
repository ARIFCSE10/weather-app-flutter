import 'package:freezed_annotation/freezed_annotation.dart';

part 'request.freezed.dart';
part 'request.g.dart';

@freezed
class Request with _$Request {
  factory Request({
    String? type,
    String? query,
    String? language,
    String? unit,
  }) = _Request;

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);
}
