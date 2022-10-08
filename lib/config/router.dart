import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/pages/login_page.dart';

import '../features/auth.dart';
import '../pages/constant_page.dart';
import '../pages/home_page.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      // TODO(shimizu-saffle): fix Exception
      redirect: (state) {
        final isAtLoginPage = state.location == LoginPage.path;
        final isLoggedIn = ref.watch(isLoggedInProvider).value;
        if (isLoggedIn == false) {
          return isAtLoginPage ? null : LoginPage.path;
        }
        return null;
      },
      routes: [
        GoRoute(
          path: HomePage.path,
          name: HomePage.name,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: LoginPage.path,
          name: LoginPage.name,
          builder: (context, state) => const LoginPage(),
        ),
      ],
      navigatorBuilder: (context, state, child) {
        return ConstantPage(child: child);
      },
      errorPageBuilder: (context, state) => MaterialPage<Widget>(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        ),
      ),
    );
  },
);
