import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/exception/exception_handler.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_belonging.dart';
import 'package:trip_app_nativeapp/features/trips/domain/interactor/trip_interactor.dart';
import 'package:trip_app_nativeapp/view/widgets/common/loading.dart';

part 'trip_belonging_controller.g.dart';

@riverpod
class TripBelongingsController extends _$TripBelongingsController {
  @override
  FutureOr<List<AddedTripBelonging>> build({required int tripId}) async {
    return ref.read(tripInteractorProvider).fetchTripBelongings(tripId);
  }

  Future<void> addBelonging({
    required int tripId,
    required String name,
    required int numOf,
    required bool isShareAmongMember,
    VoidCallback? onFinished,
  }) async {
    try {
      final result = await ref.read(tripInteractorProvider).addTripBelonging(
            tripId: tripId,
            name: name,
            numOf: numOf,
            isShareAmongMember: isShareAmongMember,
          );
      state = AsyncValue.data([result, ...state.value ?? []]);
    } on Exception catch (e) {
      ref.read(exceptionHandlerProvider).handleException(e);
    } finally {
      ref.read(overlayLoadingProvider.notifier).endLoading();
      onFinished?.call();
    }
  }

  Future<void> changeCheckStatus(AddedTripBelonging belonging) async {
    final result = await ref
        .read(tripInteractorProvider)
        .changeBelongingCheckStatus(belonging: belonging);

    state = AsyncValue.data(_changeSome(result));
  }

  List<AddedTripBelonging> _changeSome(AddedTripBelonging newBelonging) {
    return state.value?.map(
          (belonging) {
            return belonging.id == newBelonging.id ? newBelonging : belonging;
          },
        ).toList() ??
        [];
  }
}
