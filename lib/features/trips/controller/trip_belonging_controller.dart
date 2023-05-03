import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_belonging.dart';
import 'package:trip_app_nativeapp/features/trips/domain/interactor/trip_interactor.dart';

part 'trip_belonging_controller.g.dart';

@riverpod
class TripBelongingsAsyncController extends _$TripBelongingsAsyncController {
  @override
  FutureOr<List<AddedTripBelonging>> build({required int tripId}) async {
    return ref
        .read(tripInteractorProvider)
        .fetchTripBelongings(tripId);
  }
}
