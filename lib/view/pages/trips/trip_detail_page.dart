import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_controller.dart';
import 'package:trip_app_nativeapp/view/widgets/common/car_driving_loading.dart';
import 'package:trip_app_nativeapp/view/widgets/common/error_cat.dart';
import 'package:trip_app_nativeapp/view/widgets/trips/trip_overview_card.dart';

class TripDetailPage extends HookConsumerWidget {
  const TripDetailPage(this.id, {super.key});

  static const path = ':id';
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: ref.watch(tripsProvider).when(
              data: (trips) {
                final trip = trips.firstWhere((trip) => trip.id == id);
                return Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: context.displaySize.width * 9 / 16,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://tsunagutabi.com/wp-content/uploads/2020/04/%E6%97%85%E8%A1%8C%E3%83%96%E3%83%AD%E3%82%B0%E3%81%AB%E3%81%8A%E3%81%99%E3%81%99%E3%82%81%E3%81%AE%E3%83%95%E3%83%AA%E3%83%BC%E7%94%BB%E5%83%8F%EF%BC%86%E7%B4%A0%E6%9D%90%E3%82%B5%E3%82%A4%E3%83%88%E3%81%BE%E3%81%A8%E3%82%81.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      top: context.displaySize.width * 9 / 16,
                      child: TripOverviewCard(trip),
                    ),
                  ],
                );
              },
              error: ErrorCat.new,
              loading: CarDrivingLoading.new,
            ),
      ),
    );
  }
}
