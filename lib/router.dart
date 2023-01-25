import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/cache/app_user/app_user_notifier.dart';
import 'package:trip_app_nativeapp/view/pages/error_page.dart';
import 'package:trip_app_nativeapp/view/pages/home_page.dart';
import 'package:trip_app_nativeapp/view/pages/loading_page.dart';
import 'package:trip_app_nativeapp/view/pages/login_page.dart';
import 'package:trip_app_nativeapp/view/pages/trips/trips_list_page.dart';
import 'package:trip_app_nativeapp/view/pages/trips/trips_new_page.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final appUserAsync = ref.watch(appUserNotifierProvider);
  return GoRouter(
    redirect: (BuildContext context, state) {
      final isAtLoginPage = state.subloc == LoginPage.path;
      return appUserAsync.when(
        data: (user) {
          if (user == null) {
            return isAtLoginPage ? null : LoginPage.path;
          } else if (isAtLoginPage) {
            return HomePage.path;
          } else {
            return null;
          }
        },
        // HomePage の GoRoute で appUserAsync.when を使ってリダイレクトしているので、
        // ここでは error, loading であっても HomePage.path にリダイレクトする
        error: (error, stackTrace) => HomePage.path,
        loading: () => HomePage.path,
      );
    },
    routes: [
      GoRoute(
        path: HomePage.path,
        name: HomePage.name,
        builder: (context, state) => appUserAsync.when(
          data: (user) {
            if (user == null) {
              return const LoginPage();
            }
            return const HomePage();
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
        routes: [
          GoRoute(
            path: TripListPage.path,
            name: TripListPage.name,
            builder: (context, state) => const TripListPage(),
            routes: [
              GoRoute(
                path: TripNewPage.path,
                name: TripNewPage.name,
                builder: (context, state) => const TripNewPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: LoginPage.path,
        name: LoginPage.name,
        builder: (context, state) => const LoginPage(),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<Widget>(
      key: state.pageKey,
      child: ErrorPage(exception: state.error),
    ),
  );
}
