import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/core/extensions/datetime.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_controller.dart';
import 'package:trip_app_nativeapp/view/ui_utils.dart';
import 'package:trip_app_nativeapp/view/widgets/trips/editable_trip_title_text.dart';

class TripOverviewCard extends HookConsumerWidget {
  const TripOverviewCard({
    required this.tripId,
    super.key,
  });

  final int tripId;
  static const height = 150.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTrip = ref.watch(
      tripsControllerProvider.select(
        (tripsAsync) => tripsAsync.asData?.value
            .firstWhereOrNull((trip) => trip.id == tripId),
      ),
    );
    if (selectedTrip == null) {
      return const Center(
        child: Text('選択した旅が見つかりませんでした🙇‍♂️'),
      );
    }
    return Center(
      child: SizedBox(
        height: height,
        width: context.displaySize.width * 0.95,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: EditableTripTitleText(trip: selectedTrip),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () async {
                        final newFromDate = await showTripAppDatePicker(
                          context,
                          currentTime: selectedTrip.period.fromDate,
                          maxTime: selectedTrip.period.endDate,
                        );
                        if (newFromDate != null) {
                          await ref
                              .read(tripsControllerProvider.notifier)
                              .updateTrip(
                                tripId: selectedTrip.id,
                                fromDate: newFromDate,
                              );
                        }
                      },
                      child: Text(
                        '🛫 ${selectedTrip.period.fromDate.toJsonDateString()}',
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    const Text(' / '),
                    InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () async {
                        final newEndDate = await showTripAppDatePicker(
                          context,
                          currentTime: selectedTrip.period.endDate,
                          minTime: selectedTrip.period.fromDate,
                        );
                        if (newEndDate != null) {
                          await ref
                              .read(tripsControllerProvider.notifier)
                              .updateTrip(
                                tripId: selectedTrip.id,
                                endDate: newEndDate,
                              );
                        }
                      },
                      child: Text(
                        '${selectedTrip.period.endDate.toJsonDateString()} 🔚',
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 36,
                      height: 36,
                      child: IconButton(
                        onPressed: () => log('share'),
                        icon: const Icon(
                          Icons.share,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
