import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  }
}
