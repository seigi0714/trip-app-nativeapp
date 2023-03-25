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
      child: Column(
        children: [
          const Gap(8),
          // TODO(shimizu-saffle): 良い感じのアニメーションに変える
          Lottie.asset(
            Assets.lotties.travelLoading,
            height: context.displaySize.height * 0.18,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trip.title.value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Gap(8),
                Text('🛫 ${trip.tripPeriod.fromDate.toJsonDateString()}'),
                const Gap(8),
                Text('🛫 ${trip.tripPeriod.endDate.toJsonDateString()}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
