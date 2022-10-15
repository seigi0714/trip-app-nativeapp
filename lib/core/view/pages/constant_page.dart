import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../debug/logger.dart';
import '../widgets/loading.dart';

/// MaterialApp.router の builder で返すことによって
/// すべてのページ上に ConstantPage を 挿入することができるので
/// どこからでもモーダル付きインジケーターの表示や、画面タップによるアンフォーカスができる。
class ConstantPage extends HookConsumerWidget with WidgetsBindingObserver {
  const ConstantPage({
    super.key,
    required this.child,
  });

  final Widget child;

  /// アプリのライフサイクルを監視する。
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    logger.i('AppLifecycleState: ${state.name}');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        WidgetsBinding.instance.addObserver(this);
        return null;
      },
    );
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            child,
            if (ref.watch(overlayLoadingProvider)) const OverlayLoadingWidget(),
          ],
        ),
      ),
    );
  }
}
