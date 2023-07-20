import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
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

  /// [tripId] に一致する旅行情報を更新します。
  ///
  /// 更新できる情報は、[title]、[fromDate]、[endDate] のいずれかまたは全てです。
  /// これらのパラメータは null 許容となっており、null の場合は既存の情報が保持されます。
  ///
  /// [tripId] 以外の全てのパラメータが null の場合はアサーションエラーになります。
  Future<void> updateTrip({
    required int tripId,
    String? title,
    DateTime? fromDate,
    DateTime? endDate,
  }) async {
    assert(
      title != null || fromDate != null || endDate != null,
      'tripId 以外の引数が全て null だと旅情報を更新できません。',
    );
    try {
      final tripToUpdate = state.value?.firstWhere((trip) => trip.id == tripId);
      // 以下の例外のメッセージはユーザーに見せるつもりは無いが、
      // assert では null チェックが効かないので例外を投げている。
      if (tripToUpdate == null) {
        throw const AppException(message: '更新しようとしている旅が存在していません🤔');
      }
      final updatedTrip = await ref.read(tripInteractorProvider).updateTrip(
            tripId,
            title ?? tripToUpdate.title.value,
            fromDate ?? tripToUpdate.period.fromDate,
            endDate ?? tripToUpdate.period.endDate,
          );
      final updatedTrips = state.value?.map((trip) {
        if (trip.id == updatedTrip.id) {
          return updatedTrip;
        }
        return trip;
      }).toList();
      state = AsyncData(updatedTrips ?? []);
    } on Exception catch (e) {
      ref.read(exceptionHandlerProvider).handleException(e);
      rethrow;
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
