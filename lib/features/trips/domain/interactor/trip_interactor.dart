import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/features/trips/data/repositories/trip_repository.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/features/trips/domain/repositories/trip_repository_interface.dart';

part 'trip_interactor.g.dart';

@riverpod
TripInteractor tripInteractor(TripInteractorRef ref) {
  return TripInteractor(tripRepo: ref.watch(tripRepositoryProvider));
}

class TripInteractor {
  TripInteractor({required this.tripRepo});
  final TripRepositoryInterface tripRepo;
  Future<void> createTrip(
    String title,
    DateTime fromDate,
    DateTime endDate,
  ) async {
    final trip = Trip.createNewTrip(
      title: title,
      fromDate: fromDate,
      endDate: endDate,
    );
    await tripRepo.createTrip(trip);
  }
}
