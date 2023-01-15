import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/exception/exception_handler.dart';
import 'package:trip_app_nativeapp/features/trips/domain/interactor/trip_interactor.dart';
import 'package:trip_app_nativeapp/view/widgets/helpers/scaffold_messenger.dart';

part 'trip_controller.g.dart';

const createTripSuccessMessage = '旅の作成が完了しました。';
const emptyTripTitleMessage = '旅のタイトルを入力してください。';
const tripDateCompareErrorMessage = '帰宅日は出発日以降に設定してください。';

@riverpod
Future<void> createTrip(
  CreateTripRef ref, {
  required String title,
  required DateTime fromDate,
  required DateTime endDate,
}) async {
  try {
    if (title.isEmpty) {
      ref
          .read(scaffoldMessengerHelperProvider)
          .showSnackBar(emptyTripTitleMessage);
      return;
    }
    if (fromDate.compareTo(endDate) == 1) {
      ref
          .read(scaffoldMessengerHelperProvider)
          .showSnackBar(tripDateCompareErrorMessage);
      return;
    }

    await ref.read(tripInteractorProvider).createTrip(title, fromDate, endDate);

    ref
        .read(scaffoldMessengerHelperProvider)
        .showSnackBar(createTripSuccessMessage);
  } on Exception catch (e) {
    ref.read(exceptionHandlerProvider).handleException(e);
  }
}
