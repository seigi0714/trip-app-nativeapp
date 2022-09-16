import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/pages/login_page.dart';

import '../pages/constant_page.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      // TODO(shimizu-saffle): ページが増え次第、initialLocation を変更して、適切なリダイレクト処理を行う。
      initialLocation: LoginPage.path,
      routes: [
        GoRoute(
          path: LoginPage.path,
          name: LoginPage.name,
          builder: (context, state) => const LoginPage(),
        ),
      ],
      navigatorBuilder: (context, state, child) {
        return ConstantPage(child: child);
      },
      errorPageBuilder: (context, state) => MaterialPage(
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
