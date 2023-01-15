import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';
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
      throw const AppException(
        code: ExceptionCode.invalidFormValue,
        message: emptyTripTitleMessage,
      );
    }
    if (fromDate.compareTo(endDate) == 1) {
      throw const AppException(
        code: ExceptionCode.invalidFormValue,
        message: tripDateCompareErrorMessage,
      );
    }

    await ref.read(tripInteractorProvider).createTrip(title, fromDate, endDate);

    ref
        .read(scaffoldMessengerHelperProvider)
        .showSnackBar(createTripSuccessMessage);
  } on Exception catch (e) {
    ref.read(exceptionHandlerProvider).handleException(e);
    rethrow;
  }
}
