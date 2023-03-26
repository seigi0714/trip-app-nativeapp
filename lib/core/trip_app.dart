import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nil/nil.dart';
import 'package:trip_app_nativeapp/router.dart';
import 'package:trip_app_nativeapp/view/pages/constant_page.dart';
import 'package:trip_app_nativeapp/view/theme.dart';
import 'package:trip_app_nativeapp/view/widgets/helpers/scaffold_messenger.dart';

class TripApp extends StatelessWidget {
  const TripApp({
    super.key,
    this.overrides,
    this.testWidget,
  });

  final List<Override>? overrides;

  /// Widget テストの際は、テスト対象の Widget を渡す。
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
    final router = ref.watch(routerProvider);
    if (testWidget != null) {
      return MaterialApp(
        scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
        title: 'Trip App Test',
        home: testWidget,
      );
    }
    return DevicePreview(
      enabled: const bool.fromEnvironment('ENABLE_DEVICE_PREVIEW'),
      builder: (context) {
        return MaterialApp.router(
          title: 'Trip App',
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
          theme: ref.watch(lightThemeDataProvider(context)),
          darkTheme: ref.watch(darkThemeDataProvider(context)),
          builder: (context, child) {
            return DevicePreview.appBuilder(
              context,
              child == null
                  ? nil
                  : MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                      child: ConstantPage(child: child),
                    ),
            );
          },
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
        );
      },
    );
  }
}
