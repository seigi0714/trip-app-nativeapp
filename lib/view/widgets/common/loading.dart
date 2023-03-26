import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading.g.dart';

/// OverlayLoading 中か否かを切り替える操作を提供する NotifierProvider を生成する
@riverpod
class OverlayLoading extends _$OverlayLoading {
  @override
  bool build() {
    return false;
  }

  void startLoading() => state = true;

  void endLoading() => state = false;
}

/// プライマリカラーの SpinkitCircle を表示する
class PrimarySpinkitCircle extends StatelessWidget {
  const PrimarySpinkitCircle({
    super.key,
    this.size = 48,
  });

  final double size;
  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      size: size,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}

/// 二度押しを防止したいときなどに重ねるローディングウィジェット
class OverlayLoadingWidget extends StatelessWidget {
  const OverlayLoadingWidget({
    super.key,
    this.backgroundColor = Colors.black26,
  });

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: const SizedBox.expand(
        child: Center(child: PrimarySpinkitCircle()),
      ),
    );
  }
}
