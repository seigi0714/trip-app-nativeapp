import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_trip_belonging_response.freezed.dart';
part 'add_trip_belonging_response.g.dart';

@Freezed(copyWith: false)
class AddTripBelongingResponse with _$AddTripBelongingResponse {
  const factory AddTripBelongingResponse({
    required int id,
    required String name,
    required int numOf,
    required bool isSharedAmongMember,
  }) = _AddTripBelongingResponse;

  factory AddTripBelongingResponse.fromJson(Map<String, dynamic> json) =>
      _$AddTripBelongingResponseFromJson(json);
}
