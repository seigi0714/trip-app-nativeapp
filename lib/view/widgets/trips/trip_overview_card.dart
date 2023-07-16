import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/core/extensions/datetime.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/view/widgets/trips/editable_trip_title_text.dart';

class TripOverviewCard extends StatelessWidget {
  const TripOverviewCard(this.trip, {super.key});

  final ExistingTrip trip;
  static const height = 150.0;

  @override
  Widget build(BuildContext context) {
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
                    Text(
                      '🛫 ${trip.period.fromDate.toJsonDateString()}',
                      style: context.textTheme.titleMedium,
                    ),
                    const Text(' / '),
                    Text(
                      '${trip.period.endDate.toJsonDateString()} 🔚',
                      style: context.textTheme.titleMedium,
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
