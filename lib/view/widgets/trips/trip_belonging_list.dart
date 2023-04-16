import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TripBelongingList extends HookConsumerWidget {
  const TripBelongingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text('持ち物リスト'),
    );
  }
}
