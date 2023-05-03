import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/features/trips/data/models/trip_belonging_response.dart';

part 'fetch_trip_belongings_response.freezed.dart';
part 'fetch_trip_belongings_response.g.dart';

@freezed
class FetchTripBelongingsResponse with _$FetchTripBelongingsResponse {
  const factory FetchTripBelongingsResponse({
    required List<TripBelongingResponse> items,
  }) = _FetchTripBelongingsResponse;

  factory FetchTripBelongingsResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchTripBelongingsResponseFromJson(json);
}
