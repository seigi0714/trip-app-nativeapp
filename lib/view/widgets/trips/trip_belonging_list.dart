import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_belonging_controller.dart';
import 'package:trip_app_nativeapp/view/widgets/common/car_driving_loading.dart';
import 'package:trip_app_nativeapp/view/widgets/common/error_cat.dart';
import 'package:trip_app_nativeapp/view/widgets/trips/add_trip_belonging_sheet.dart';
import 'package:trip_app_nativeapp/view/widgets/trips/trip_belonging_item.dart';

class TripBelongingList extends HookConsumerWidget {
  const TripBelongingList(this.tripId, {super.key});

  final int tripId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(tripBelongingsControllerProvider(tripId: tripId)).when(
          data: (belongings) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: belongings.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TripBelongingItem(
                        tripId: tripId,
                        belonging: belongings[index],
                      );
                    },
                  ),
                ),
                Container(
                  width: 52,
                  padding: const EdgeInsets.all(8),
                  child: FittedBox(
                    child: FloatingActionButton(
                      onPressed: () => showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => AddTripBelongingSheet(tripId),
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          },
          error: ErrorCat.new,
          loading: CarDrivingLoading.new,
        );
  }
}
