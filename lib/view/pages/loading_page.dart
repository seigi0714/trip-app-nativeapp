import 'package:flutter/material.dart';
import 'package:trip_app_nativeapp/view/widgets/common/loading.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  static const path = '/loading';
  static const name = 'LoadingPage';

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Center(
        child: PrimarySpinkitCircle(),
      ),
    );
  }
}
