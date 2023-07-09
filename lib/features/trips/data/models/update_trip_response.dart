import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/core/json_converter/datetime_converter.dart';
import 'package:trip_app_nativeapp/features/trips/data/models/fetch_trip_member_response.dart';

part 'update_trip_response.freezed.dart';
part 'update_trip_response.g.dart';

@freezed
class UpdateTripResponse with _$UpdateTripResponse {
  const factory UpdateTripResponse({
    required int id,
    required String name,
    required List<FetchTripMemberResponse> members,
    @DateConverter() required DateTime fromDate,
    @DateConverter() required DateTime endDate,
  }) = _UpdateTripResponse;

  factory UpdateTripResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTripResponseFromJson(json);
}
