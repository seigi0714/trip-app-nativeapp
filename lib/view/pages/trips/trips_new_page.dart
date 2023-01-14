import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TripNewPage extends HookConsumerWidget {
  const TripNewPage({super.key});

  static const path = 'new_trips';
  static const name = 'NewTripPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('新規作成'),
        ),
      ),
    );
  }
}
