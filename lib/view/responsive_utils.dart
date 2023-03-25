import 'package:flutter/material.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';

int getCrossAxisCount(BuildContext context) {
  final screenWidth = context.displaySize.width;
  if (screenWidth >= 1280) {
    return 4;
  } else if (screenWidth >= 768) {
    return 3;
  } else {
    return 2;
  }
}

double getAspectRatio(BuildContext context) =>
    context.displaySize.width / (context.displaySize.height * 0.65);
