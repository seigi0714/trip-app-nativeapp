import 'package:flutter_test/flutter_test.dart';
import 'package:trip_app_nativeapp/core/trip_app.dart';
import 'package:trip_app_nativeapp/view/pages/constant_page.dart';
import 'package:trip_app_nativeapp/view/pages/home_page.dart';
import 'package:trip_app_nativeapp/view/widgets/loading.dart';

void main() {
  testWidgets(
    ''' overlayLoadingProvider が true の時は
      ConstantPage 上に OverlayLoadingWidget が表示されているはず。''',
    (tester) async {
      await tester.pumpWidget(
        TripApp(
          overrides: [overlayLoadingProvider.overrideWith((ref) => true)],
          testWidget: const ConstantPage(child: HomePage()),
        ),
      );
      expect(find.byType(OverlayLoadingWidget), findsOneWidget);
    },
  );
}
