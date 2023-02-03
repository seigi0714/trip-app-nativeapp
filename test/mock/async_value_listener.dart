import 'package:mocktail/mocktail.dart';

/// AsyncValue の 値の変化を監視するためのリスナー
class AsyncValueListener<T> extends Mock {
  void call(T? previous, T next);
}
