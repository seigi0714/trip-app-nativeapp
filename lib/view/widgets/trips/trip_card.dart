import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/core/extensions/datetime.dart';
import 'package:trip_app_nativeapp/core/gen/assets.gen.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';

class TripCard extends StatelessWidget {
  const TripCard(this.trip, {super.key});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Columnの高さを最小限にする
          children: [
            Expanded(
              child: Lottie.asset(
                Assets.lotties.tripCard,
                height: context.displaySize.height * 0.14,
              ),
            ),
            Text(
              trip.title.value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleLarge,
            ),
            const Gap(8),
            Text(
              '🛫 ${trip.tripPeriod.fromDate.toJsonDateString()}',
              style: context.textTheme.titleMedium,
            ),
            const Gap(8),
            Text(
              '${trip.tripPeriod.endDate.toJsonDateString()} 🔚',
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
