import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/features/user/controller/app_user_controller.dart';
import 'package:trip_app_nativeapp/view/pages/debug_page.dart';
import 'package:trip_app_nativeapp/view/pages/error_page.dart';
import 'package:trip_app_nativeapp/view/pages/loading_page.dart';
import 'package:trip_app_nativeapp/view/pages/login_page.dart';
import 'package:trip_app_nativeapp/view/pages/trips/trip_detail_page.dart';
import 'package:trip_app_nativeapp/view/pages/trips/trips_list_page.dart';

part 'router.g.dart';

@riverpod
// なぜかこのルール違反が出ちゃう。パッケージのバグだと思うので、一旦 ignore しておく
// riverpod/packages/riverpod_lint/lib/src/lints/unsupported_provider_value.dart の
// ソースコードを読んだだけだと、この現象の原因は分からなかった。
// ignore: unsupported_provider_value
GoRouter router(RouterRef ref) {
  final appUserAsync = ref.watch(appUserControllerProvider);
  return GoRouter(
    initialLocation: kDebugMode ? DebugPage.path : TripListPage.path,
    redirect: (BuildContext context, state) {
      final isAtLoginPage = state.subloc == LoginPage.path;
      return appUserAsync.maybeWhen(
        data: (user) {
          if (user == null) {
            return isAtLoginPage ? null : LoginPage.path;
          } else if (isAtLoginPage) {
            return DebugPage.path;
          } else {
            return null;
          }
        },
        // ここを null にしておかないと、アプリ起動時に一瞬 ErrorPage が表示されてしまう
        orElse: () => null,
      );
    },
    routes: [
      GoRoute(
        path: DebugPage.path,
        builder: (context, state) => appUserAsync.when(
          data: (user) {
            if (user == null) {
              return const LoginPage();
            }
            return const DebugPage();
          },
          loading: () => const LoadingPage(),
          error: (error, stackTrace) {
            if (error is Exception) {
              return ErrorPage(exception: error);
            } else {
              return const ErrorPage(exception: null);
            }
          },
        ),
      ),
      GoRoute(
        path: TripListPage.path,
        builder: (context, state) => const TripListPage(),
        routes: [
          GoRoute(
            path: TripDetailPage.pathParam,
            builder: (context, state) {
              final id = int.tryParse(state.params['id'] ?? '');
              if (id != null) {
                return TripDetailPage(id);
              } else {
                return const ErrorPage(
                  exception: AppException(message: '旅の選択に失敗しました。'),
                );
              }
            },
          ),
        ],
      ),
      GoRoute(
        path: LoginPage.path,
        builder: (context, state) => const LoginPage(),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<Widget>(
      key: state.pageKey,
      child: ErrorPage(exception: state.error),
    ),
  );
}
