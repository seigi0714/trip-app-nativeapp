import 'package:flutter/material.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';

class TripSchedule extends StatelessWidget {
  const TripSchedule(this.trip, {super.key});

  final ExistingTrip trip;
  static const height = 150.0;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('スケジュール'),
    );
  }
}
