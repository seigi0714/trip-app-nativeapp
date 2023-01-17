import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';

part 'trip_interactor.g.dart';

@riverpod
TripInteractor tripInteractor(TripInteractorRef ref) {
  return TripInteractor();
}

class TripInteractor {
  Future<void> createTrip(
    String title,
    DateTime fromDate,
    DateTime endDate,
  ) async {
    // TODO(seigi0714): あとで実装
    final tripEntity = Trip.createNewTrip(title: title, fromDate: fromDate, endDate: endDate);
  }
}
