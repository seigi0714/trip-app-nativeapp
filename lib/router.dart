import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/view/pages/loading_page.dart';
import 'package:trip_app_nativeapp/view/pages/login_page.dart';

import 'features/auth/controller/auth_controller.dart';
import 'view/pages/error_page.dart';
import 'view/pages/home_page.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final user = ref.watch(firebaseAuthUserProvider);
  return GoRouter(
    redirect: (BuildContext context, state) {
      final isAtLoginPage = state.subloc == LoginPage.path;
      if (user.value == null) {
        return isAtLoginPage ? null : LoginPage.path;
      } else if (isAtLoginPage) {
        return HomePage.path;
      } else {
        return null;
      }
    },
    routes: [
      GoRoute(
        path: HomePage.path,
        name: HomePage.name,
        builder: (context, state) => user.when(
          data: (user) {
            if (user == null) {
              return const LoginPage();
            }
            return const HomePage();
          },
          error: (error, stackTrace) =>
              ErrorPage(errorMessage: state.error.toString()),
          loading: () => const LoadingPage(),
        ),
      ),
      GoRoute(
        path: LoginPage.path,
        name: LoginPage.name,
        builder: (context, state) => const LoginPage(),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<Widget>(
      key: state.pageKey,
      child: ErrorPage(errorMessage: state.error.toString()),
    ),
  );
}
