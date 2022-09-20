import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferencesKey で管理するデータの列挙
enum SharedPreferencesKey {
  idToken,
}

/// SharedPreferences のインスタンスを提供するプロバイダ。
final sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());

/// SharedPreferences によるデータの読み書きをする
/// サービスクラスを提供するプロバイダ。
final sharedPreferencesServiceProvider = Provider<SharedPreferencesService>(
  (ref) => SharedPreferencesService(ref.read),
);

class SharedPreferencesService {
  SharedPreferencesService(this._read);
  final Reader _read;

  /// idToken と nonce を SharedPreferences に書き込む。
  Future<void> login({
    required String idToken,
    required String nonce,
  }) async {
    await _setString(key: SharedPreferencesKey.idToken, value: idToken);
  }

  Future<void> logout() async {
    await _removeByKey(SharedPreferencesKey.idToken);
  }

  /// String 型のキー・バリューペアを保存する
  Future<bool> _setString({
    required SharedPreferencesKey key,
    required String value,
  }) async {
    return _read(sharedPreferencesProvider).setString(key.name, value);
  }

  /// SharedPreferences に保存している特定のキー・バリューペアを削除する
  Future<bool> _removeByKey(SharedPreferencesKey key) async {
    return _read(sharedPreferencesProvider).remove(key.name);
  }
}
