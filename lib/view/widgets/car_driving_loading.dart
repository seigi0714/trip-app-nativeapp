import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/core/gen/assets.gen.dart';

class CarDrivingLoading extends StatelessWidget {
  const CarDrivingLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      Assets.lotties.carDrivingLandscape,
      height: context.displaySize.height * 0.18,
    );
  }
}
