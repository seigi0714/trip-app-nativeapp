import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/view/pages/trips/trips_new_page.dart';

class TripListPage extends HookConsumerWidget {
  const TripListPage({super.key});

  static const path = 'trips';
  static const name = 'TripListPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/$path/${TripNewPage.path}'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('旅一覧ページ'),
        ),
      ),
    );
  }
}
