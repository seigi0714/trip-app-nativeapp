import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/core/json_converter/datetime_converter.dart';
import 'package:trip_app_nativeapp/features/trips/data/models/fetch_trip_member_response.dart';

part 'fetch_trip_response.freezed.dart';
part 'fetch_trip_response.g.dart';

@freezed
class FetchTripResponse with _$FetchTripResponse {
  const factory FetchTripResponse({
    required int id,
    required String name,
    required List<FetchTripMemberResponse> members,
    @DateConverter() required DateTime fromDate,
    @DateConverter() required DateTime endDate,
  }) = _FetchTripResponse;

  factory FetchTripResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchTripResponseFromJson(json);
}
