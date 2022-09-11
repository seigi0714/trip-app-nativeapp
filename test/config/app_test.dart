import 'package:flutter_test/flutter_test.dart';
import 'package:trip_app_nativeapp/config/app.dart';
import 'package:trip_app_nativeapp/pages/constant_page.dart';

void main() {
  testWidgets('アプリの起動テスト, ConstantPage が存在しているはず。', (tester) async {
    await tester.pumpWidget(
      const TripApp(),
    );
    expect(find.byType(ConstantPage), findsOneWidget);
  });
}
