import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/core/extensions/datetime.dart';
import 'package:trip_app_nativeapp/core/gen/assets.gen.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_controller.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/view/pages/trips/trips_new_page.dart';
import 'package:trip_app_nativeapp/view/widgets/car_driving_loading.dart';

class TripListPage extends HookConsumerWidget {
  const TripListPage({super.key});

  static const path = 'trips';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ref.watch(tripsProvider).when(
                data: (trips) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.66,
                    ),
                    padding: const EdgeInsets.all(16),
                    itemCount: trips.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _TripCard(trips[index]);
                    },
                  );
                },
                // TODO(shimizu-saffle):  デザイン良い感じにする
                error: (error, stackTrace) => const Text('エラーが発生しました。'),
                loading: CarDrivingLoading.new,
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
