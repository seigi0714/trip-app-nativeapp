import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/core/extensions/datetime.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_controller.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/view/ui_utils.dart';
import 'package:trip_app_nativeapp/view/widgets/trips/editable_trip_title_text.dart';

class TripOverviewCard extends HookConsumerWidget {
  const TripOverviewCard(this.trip, {super.key});

  final ExistingTrip trip;
  static const height = 150.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromDate = useState(trip.period.fromDate);
    final endDate = useState(trip.period.endDate);
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
                    child: EditableTripTitleText(trip: trip),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () async {
                        final newFromDate = await showTripAppDatePicker(
                          context,
                          dateTimeNotifier: fromDate,
                          maxTime: endDate.value,
                        );
                        if (newFromDate != null) {
                          try {
                            await ref
                                .read(tripsControllerProvider.notifier)
                                .updateTrip(
                                  tripId: trip.id,
                                  fromDate: newFromDate,
                                );
                          } catch (_) {
                            // 更新に失敗した場合は元の日付に戻してリビルドする。
                            fromDate.value = trip.period.fromDate;
                          }
                        }
                      },
                      child: Text(
                        '🛫 ${fromDate.value.toJsonDateString()}',
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    const Text(' / '),
                    InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () async {
                        final newEndDate = await showTripAppDatePicker(
                          context,
                          dateTimeNotifier: endDate,
                          minTime: fromDate.value,
                        );
                        if (newEndDate != null) {
                          try {
                            await ref
                                .read(tripsControllerProvider.notifier)
                                .updateTrip(
                                  tripId: trip.id,
                                  endDate: newEndDate,
                                );
                          } catch (_) {
                            // 更新に失敗した場合は元の日付に戻してリビルドする。
                            endDate.value = trip.period.endDate;
                          }
                        }
                      },
                      child: Text(
                        '${endDate.value.toJsonDateString()} 🔚',
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
