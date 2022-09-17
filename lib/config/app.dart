import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/scaffold_messenger_service.dart';
import 'router.dart';

class TripApp extends StatelessWidget {
  const TripApp({
    super.key,
    this.overrides,
    this.testWidget,
  });

  final List<Override>? overrides;

  /// Widget テストの際に、コンストラクタの引数にテスト対象の Widget を渡す。
  @visibleForTesting
  final Widget? testWidget;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: overrides ?? [],
      child: _TripApp(
        testWidget: testWidget,
      ),
    );
  }
}

class _TripApp extends ConsumerWidget {
  const _TripApp({
    this.testWidget,
  });

  final Widget? testWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (testWidget != null) {
      return MaterialApp(
        scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
        title: 'Trip App Test',
        home: testWidget,
      );
    }

    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Trip App',
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      theme: ThemeData(
        textTheme: GoogleFonts.zenMaruGothicTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
