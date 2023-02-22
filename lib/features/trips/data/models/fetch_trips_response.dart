import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/features/trips/data/models/fetch_trip_response.dart';

part 'fetch_trips_response.freezed.dart';
part 'fetch_trips_response.g.dart';

@freezed
class FetchTripsResponse with _$FetchTripsResponse {
  const factory FetchTripsResponse({
    @Default([]) List<FetchTripResponse> items,
  }) = _FetchTripsResponse;

  factory FetchTripsResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchTripsResponseFromJson(json);
}
