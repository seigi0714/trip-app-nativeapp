import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/core/extensions/datetime.dart';
import 'package:trip_app_nativeapp/core/gen/assets.gen.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_period.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_title.dart';
import 'package:trip_app_nativeapp/view/pages/trips/trips_new_page.dart';

class TripListPage extends HookConsumerWidget {
  const TripListPage({super.key});

  static const path = 'trips';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            padding: const EdgeInsets.all(16),
            childAspectRatio: 0.66,
            children: [
              _TripCard(_mockTrip),
              _TripCard(_mockTrip),
              _TripCard(_mockTrip),
              _TripCard(_mockTrip),
              _TripCard(_mockTrip),
              _TripCard(_mockTrip),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/$path/${TripNewPage.path}'),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

final _mockTrip = Trip(
  title: TripTitle(
    value: 'ベトナム旅行',
  ),
  tripPeriod: TripPeriod(
    fromDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 3)),
  ),
);

class _TripCard extends StatelessWidget {
  const _TripCard(this.trip);

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
