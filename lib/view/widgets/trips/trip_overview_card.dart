import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/core/extensions/datetime.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';

class TripOverviewCard extends StatelessWidget {
  const TripOverviewCard(this.trip, {super.key});

  final ExistingTrip trip;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150,
        width: context.displaySize.width * 0.9,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    trip.title.value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleLarge,
                  ),
                  const Gap(8),
                  Text(
                    '🛫 ${trip.period.fromDate.toJsonDateString()}',
                    style: context.textTheme.titleMedium,
                  ),
                  const Gap(8),
                  Text(
                    '${trip.period.endDate.toJsonDateString()} 🔚',
                    style: context.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
