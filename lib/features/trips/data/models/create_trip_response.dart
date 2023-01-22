import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/core/json_converter/date_converter.dart';

part 'create_trip_response.freezed.dart';
part 'create_trip_response.g.dart';

@freezed
class CreateTripResponse with _$CreateTripResponse {
  const factory CreateTripResponse({
    required String name,
    @DateConverter() required DateTime  fromDate,
    @DateConverter() required DateTime  endDate, 
  }) = _CreateTripResponse;

  factory CreateTripResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTripResponseFromJson(json);
}
