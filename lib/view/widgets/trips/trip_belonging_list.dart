import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_belonging_controller.dart';
import 'package:trip_app_nativeapp/view/widgets/common/car_driving_loading.dart';
import 'package:trip_app_nativeapp/view/widgets/common/error_cat.dart';

class TripBelongingList extends HookConsumerWidget {
  const TripBelongingList(this.tripId, {super.key});

  final int tripId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(tripBelongingsAsyncControllerProvider(tripId: tripId))
        .when(
          data: (belongings) {
            return ListView.builder(
              itemCount: belongings.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(belongings[index].name.value);
              },
            );
          },
          error: ErrorCat.new,
          loading: CarDrivingLoading.new,
        );
  }
}
