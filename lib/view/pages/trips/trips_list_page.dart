import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_controller.dart';
import 'package:trip_app_nativeapp/view/widgets/common/car_driving_loading.dart';
import 'package:trip_app_nativeapp/view/widgets/common/error_cat.dart';
import 'package:trip_app_nativeapp/view/widgets/trips/create_trip_sheet.dart';
import 'package:trip_app_nativeapp/view/widgets/trips/trip_card.dart';

class TripListPage extends HookConsumerWidget {
  const TripListPage({super.key});

  static const path = '/trips';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ref.watch(tripsControllerProvider).when(
              data: (trips) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    crossAxisCount: context.responsiveCrossAxisItemCount,
                    childAspectRatio: context.responsiveGridCardAspectRatio,
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
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (context) => const CreateTripSheet(),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
