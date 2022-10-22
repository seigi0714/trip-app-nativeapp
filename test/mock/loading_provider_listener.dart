import 'package:mockito/mockito.dart';

/// ローディング関連のプロバイダー内の値を監視するクラス
class LoadingProviderListener extends Mock {
  // ignore: avoid_positional_boolean_parameters
  void call(bool? previous, bool next);
}
