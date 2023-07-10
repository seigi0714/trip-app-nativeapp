import 'package:flutter/services.dart';
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
class TripsController extends _$TripsController {
  @override
  FutureOr<List<ExistingTrip>> build() {
    try {
      return ref
          .read(tripInteractorProvider)
          .fetchTripsByUserId(ref.watch(appUserControllerProvider).value!.id);
    } on Exception catch (e) {
      ref.read(exceptionHandlerProvider).handleException(e);
      rethrow;
    }
  }

  Future<void> createTrip({
    required String title,
    required DateTime fromDate,
    required DateTime endDate,
    VoidCallback? onSuccess,
  }) async {
    try {
      final newTrip = await ref
          .read(tripInteractorProvider)
          .createTrip(title, fromDate, endDate);

      state = AsyncData([...state.value ?? [], newTrip]);

      ref
          .read(scaffoldMessengerHelperProvider)
          .showSnackBar(createTripSuccessMessage);
      onSuccess?.call();
    } on Exception catch (e) {
      ref.read(exceptionHandlerProvider).handleException(e);
    }
  }

  Future<void> generateAndCopyInviteLink({
    required int tripId,
    required int invitationNum,
  }) async {
    const successMessage = '招待リンクをクリップボードにコピーしました。';
    try {
      ref.read(overlayLoadingProvider.notifier).startLoading();
      final invitation = await ref
          .read(tripInteractorProvider)
          .invite(tripId: tripId, invitationNum: invitationNum);

      // TODO(seigi0714): ダイナミックリンクをクリップボードにコピー
      final data = ClipboardData(text: invitation.invitationCode);
      await Clipboard.setData(data);
      ref.read(scaffoldMessengerHelperProvider).showSnackBar(successMessage);
    } on Exception catch (e) {
      ref.read(exceptionHandlerProvider).handleException(e);
    } finally {
      ref.read(overlayLoadingProvider.notifier).endLoading();
    }
  }
}
