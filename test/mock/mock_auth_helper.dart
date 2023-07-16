import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

/// Firebase Auth のサインインをシミュレートし、 Dio のモックレスポンスを設定することで、
/// ユーザーログインプロセスをモックする。
///
/// * [dio] モックレスポンスが付与される [Dio] のインスタンス。
/// * [mockUserRes] Dio インスタンスによって返されるモックユーザーレスポンスデータ。
/// * [mockFirebaseUser] サインインシミュレーションに使用されるモック Firebase Auth ユーザー。
///
/// サインインシミュレーション済みの MockFirebaseAuth インスタンスと、
/// モックレスポンスが付与された Dio インスタンスを返す。
Future<(MockFirebaseAuth, Dio)> mockLogin({
  required Dio dio,
  required Map<String, dynamic> mockUserRes,
  required MockUser mockFirebaseUser,
}) async {
  return (
    await _mockFirebaseAuthSignIn(mockFirebaseUser),
    _setDioMockResponse(dio, mockUserRes)
  );
}

Dio _setDioMockResponse(Dio dio, Map<String, dynamic> mockUserRes) {
  DioAdapter(dio: dio).onGet(
    '/my/profile',
    (server) => server.reply(
      200,
      mockUserRes,
    ),
  );
  return dio;
}

Future<MockFirebaseAuth> _mockFirebaseAuthSignIn(
  MockUser firebaseAuthUser,
) async {
  final googleUser = await MockGoogleSignIn().signIn();
  final signInAccount = await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: signInAccount?.accessToken,
    idToken: signInAccount?.idToken,
  );
  final mockAuth = MockFirebaseAuth(mockUser: firebaseAuthUser);
  await mockAuth.signInWithCredential(credential);
  return mockAuth;
}
