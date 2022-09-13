import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/config/app.dart';
import 'package:trip_app_nativeapp/utils/loading.dart';

void main() {
  testWidgets(
    ''' overlayLoadingProvider が true の時は
      ConstantPage 上に OverlayLoadingWidget が表示されているはず。''',
    (tester) async {
      await tester.pumpWidget(
        TripApp(
          overrides: [
            overlayLoadingProvider
                .overrideWithValue(StateController<bool>(true)),
          ],
        ),
      );
      expect(find.byType(OverlayLoadingWidget), findsOneWidget);
    },
  );
}
