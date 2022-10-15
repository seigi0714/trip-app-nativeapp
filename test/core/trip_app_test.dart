import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trip_app_nativeapp/core/trip_app.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:trip_app_nativeapp/features/auth/presentation/pages/login_page.dart';

void main() {
  testWidgets('アプリの初回起動時は、LoginPage が表示されるはず。', (tester) async {
    await tester.pumpWidget(
      TripApp(
        overrides: [
          firebaseAuthProvider.overrideWithValue(
            MockFirebaseAuth(),
          ),
        ],
      ),
    );
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
