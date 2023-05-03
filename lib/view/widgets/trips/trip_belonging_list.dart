import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_belonging_controller.dart';
import 'package:trip_app_nativeapp/view/widgets/common/car_driving_loading.dart';
import 'package:trip_app_nativeapp/view/widgets/common/error_cat.dart';

class TripBelongingList extends HookConsumerWidget {
  const TripBelongingList(this.tripId, {super.key});

  final int tripId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(tripBelongingsControllerProvider(tripId: tripId))
        .when(
          data: (belongings) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: belongings.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'isCheck: ${belongings[index].isChecked}  ',
                            style: context.textTheme.titleSmall,
                          ),
                          Text(
                            belongings[index].name.value,
                            style: context.textTheme.titleMedium,
                          ),
                          Text(
                            ' isShare: ${belongings[index].isShareAmongMember}',
                            style: context.textTheme.titleSmall,
                          ),
                        ],
                      );
                    },
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
