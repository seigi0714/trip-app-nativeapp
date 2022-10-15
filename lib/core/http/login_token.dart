import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_preferences.dart';

/// ProviderScope.overrides でインスタンスを生成・上書きして使用する。
final loginTokenProvider = Provider<String>((_) => '');

/// ルートの ProviderScope.overrides で idTokenProvider の値を上書きする目的で、
/// SharedPreferences に格納している idToken を取得して返す。
/// 未ログインで idToken が見つからない場合は空文字を返す。
/// Provider.overrides が済んだ後は、WidgetRef や Reader 経由で idTokenProvider を使用すると、
/// Future 型にもならず便利。
Future<String> get loginToken async {
  final sp = await SharedPreferences.getInstance();
  return sp.getString(SharedPreferencesKey.loginToken.name) ?? '';
}
