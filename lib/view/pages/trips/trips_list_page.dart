import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_controller.dart';
import 'package:trip_app_nativeapp/view/pages/trips/trips_new_page.dart';
import 'package:trip_app_nativeapp/view/widgets/car_driving_loading.dart';
import 'package:trip_app_nativeapp/view/widgets/error_cat.dart';
import 'package:trip_app_nativeapp/view/widgets/trip_card.dart';

class TripListPage extends HookConsumerWidget {
  const TripListPage({super.key});

  static const path = 'trips';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ref.watch(tripsProvider).when(
              data: (trips) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    crossAxisCount: context.getCrossAxisCount,
                    childAspectRatio: context.responsiveAspectRatio,
                  ),
                  padding: const EdgeInsets.all(16),
                  itemCount: trips.length,
                  itemBuilder: (BuildContext context, int index) =>
                      TripCard(trips[index]),
                );
              },
              error: ErrorCat.new,
              loading: CarDrivingLoading.new,
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
