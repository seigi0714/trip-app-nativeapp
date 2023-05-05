import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/exception/exception_handler.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/features/trips/domain/interactor/trip_interactor.dart';
import 'package:trip_app_nativeapp/features/user/controller/app_user_controller.dart';
import 'package:trip_app_nativeapp/view/widgets/common/loading.dart';
import 'package:trip_app_nativeapp/view/widgets/helpers/scaffold_messenger.dart';

part 'trip_controller.g.dart';

const createTripSuccessMessage = '旅の作成が完了しました。';
const emptyTripTitleMessage = '旅のタイトルを入力してください。';
const tripDateCompareErrorMessage = '帰宅日は出発日以降に設定してください。';

@riverpod
Future<List<ExistingTrip>> trips(TripsRef ref) => ref
    .watch(tripControllerProvider)
    .fetchTripsByUserId(ref.watch(appUserControllerProvider).value!.id);

@riverpod
TripController tripController(TripControllerRef ref) => TripController(ref);

class TripController {
  TripController(this._ref);
  final Ref _ref;

  Future<void> createTrip({
    required String title,
    required DateTime fromDate,
    required DateTime endDate,
    VoidCallback? onSuccess,
  }) async {
    try {
      await _ref
          .read(tripInteractorProvider)
          .createTrip(title, fromDate, endDate);

      _ref
          .read(scaffoldMessengerHelperProvider)
          .showSnackBar(createTripSuccessMessage);
      onSuccess?.call();
    } on Exception catch (e) {
      _ref.read(exceptionHandlerProvider).handleException(e);
    }
  }

  Future<List<ExistingTrip>> fetchTripsByUserId(int userId) {
    try {
      return _ref.read(tripInteractorProvider).fetchTripsByUserId(userId);
    } on Exception catch (e) {
      _ref.read(exceptionHandlerProvider).handleException(e);
      rethrow;
    }
  }

  Future<void> generateAndCopyInviteLink({
    required int tripId,
  }) async {
    const successMessage = '招待リンクをクリップボードにコピーしました。';
    try {
      _ref.read(overlayLoadingProvider.notifier).startLoading();
      final invitation =
          await _ref.read(tripInteractorProvider).invite(tripId: tripId);

      // TODO(seigi0714): ダイナミックリンクをクリップボードにコピー
      final data = ClipboardData(text: invitation.invitationCode);
      await Clipboard.setData(data);
      _ref.read(scaffoldMessengerHelperProvider).showSnackBar(successMessage);
    } on Exception catch (e) {
      _ref.read(exceptionHandlerProvider).handleException(e);
    } finally {
      _ref.read(overlayLoadingProvider.notifier).endLoading();
    }
  }
}
