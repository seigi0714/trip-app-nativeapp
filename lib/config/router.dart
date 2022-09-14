import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pages/constant_page.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      routes: [
        // 以下のようにルートを定義していく
        // GoRoute(
        //   path: ExamplePage.path,
        //   name: ExamplePage.name,
        //   pageBuilder: (context, state) => MaterialPage(
        //     key: state.pageKey,
        //     child: const ExamplePage(),
        //   ),
        // ),
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
