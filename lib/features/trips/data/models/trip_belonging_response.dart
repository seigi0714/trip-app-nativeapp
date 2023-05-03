import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_belonging.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_belonging_name.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_belonging_num.dart';

part 'trip_belonging_response.freezed.dart';
part 'trip_belonging_response.g.dart';

@Freezed(copyWith: false)
class TripBelongingResponse with _$TripBelongingResponse {
  const factory TripBelongingResponse({
    required int id,
    required String name,
    required int numOf,
    required bool isShareAmongMember,
    bool? isChecked,
  }) = _TripBelongingResponse;

  factory TripBelongingResponse.fromJson(Map<String, dynamic> json) =>
      _$TripBelongingResponseFromJson(json);
}
