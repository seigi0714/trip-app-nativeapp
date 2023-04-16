import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/core/extensions/datetime.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';

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
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      trip.title.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '🛫 ${trip.period.fromDate.toJsonDateString()}',
                          style: context.textTheme.titleMedium,
                        ),
                        Text(
                          '${trip.period.endDate.toJsonDateString()} 🔚',
                          style: context.textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => log('share'),
                          icon: const Icon(
                            Icons.share,
                          ),
                        ),
                        IconButton(
                          onPressed: () => log('edit'),
                          icon: const Icon(
                            Icons.edit,
                          ),
                        ),
                      ],
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
