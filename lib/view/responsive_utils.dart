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

double getAspectRatio(BuildContext context) {
  final screenWidth = context.displaySize.width;
  if (screenWidth >= 1280) {
    return 0.7;
  } else if (screenWidth >= 768) {
    return 0.8;
  } else {
    return 0.66;
  }
}
