// Mocks generated by Mockito 5.4.2 from annotations
// in trip_app_nativeapp/test/feature/trips/controller/trip_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:mockito/mockito.dart' as _i1;
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart'
    as _i3;
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_belonging.dart'
    as _i5;
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_invitation.dart'
    as _i4;
import 'package:trip_app_nativeapp/features/trips/domain/interactor/trip_interactor.dart'
    as _i6;
import 'package:trip_app_nativeapp/features/trips/domain/repositories/trip_repository_interface.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTripRepositoryInterface_0 extends _i1.SmartFake
    implements _i2.TripRepositoryInterface {
  _FakeTripRepositoryInterface_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeExistingTrip_1 extends _i1.SmartFake implements _i3.ExistingTrip {
  _FakeExistingTrip_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGeneratedTripInvitation_2 extends _i1.SmartFake
    implements _i4.GeneratedTripInvitation {
  _FakeGeneratedTripInvitation_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddedTripBelonging_3 extends _i1.SmartFake
    implements _i5.AddedTripBelonging {
  _FakeAddedTripBelonging_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TripInteractor].
///
/// See the documentation for Mockito's code generation for more information.
class MockTripInteractor extends _i1.Mock implements _i6.TripInteractor {
  MockTripInteractor() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TripRepositoryInterface get tripRepo => (super.noSuchMethod(
        Invocation.getter(#tripRepo),
        returnValue: _FakeTripRepositoryInterface_0(
          this,
          Invocation.getter(#tripRepo),
        ),
      ) as _i2.TripRepositoryInterface);
  @override
  _i7.Future<_i3.ExistingTrip> createTrip(
    String? title,
    DateTime? fromDate,
    DateTime? endDate,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #createTrip,
          [
            title,
            fromDate,
            endDate,
          ],
        ),
        returnValue: _i7.Future<_i3.ExistingTrip>.value(_FakeExistingTrip_1(
          this,
          Invocation.method(
            #createTrip,
            [
              title,
              fromDate,
              endDate,
            ],
          ),
        )),
      ) as _i7.Future<_i3.ExistingTrip>);
  @override
  _i7.Future<_i3.ExistingTrip> updateTrip(
    int? id,
    String? title,
    DateTime? fromDate,
    DateTime? endDate,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateTrip,
          [
            id,
            title,
            fromDate,
            endDate,
          ],
        ),
        returnValue: _i7.Future<_i3.ExistingTrip>.value(_FakeExistingTrip_1(
          this,
          Invocation.method(
            #updateTrip,
            [
              id,
              title,
              fromDate,
              endDate,
            ],
          ),
        )),
      ) as _i7.Future<_i3.ExistingTrip>);
  @override
  _i7.Future<_i4.GeneratedTripInvitation> invite({
    required int? tripId,
    required int? invitationNum,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #invite,
          [],
          {
            #tripId: tripId,
            #invitationNum: invitationNum,
          },
        ),
        returnValue: _i7.Future<_i4.GeneratedTripInvitation>.value(
            _FakeGeneratedTripInvitation_2(
          this,
          Invocation.method(
            #invite,
            [],
            {
              #tripId: tripId,
              #invitationNum: invitationNum,
            },
          ),
        )),
      ) as _i7.Future<_i4.GeneratedTripInvitation>);
  @override
  _i7.Future<List<_i3.ExistingTrip>> fetchTripsByUserId(int? userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchTripsByUserId,
          [userId],
        ),
        returnValue:
            _i7.Future<List<_i3.ExistingTrip>>.value(<_i3.ExistingTrip>[]),
      ) as _i7.Future<List<_i3.ExistingTrip>>);
  @override
  _i7.Future<_i5.AddedTripBelonging> addTripBelonging({
    required int? tripId,
    required String? name,
    required int? numOf,
    required bool? isShareAmongMember,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addTripBelonging,
          [],
          {
            #tripId: tripId,
            #name: name,
            #numOf: numOf,
            #isShareAmongMember: isShareAmongMember,
          },
        ),
        returnValue:
            _i7.Future<_i5.AddedTripBelonging>.value(_FakeAddedTripBelonging_3(
          this,
          Invocation.method(
            #addTripBelonging,
            [],
            {
              #tripId: tripId,
              #name: name,
              #numOf: numOf,
              #isShareAmongMember: isShareAmongMember,
            },
          ),
        )),
      ) as _i7.Future<_i5.AddedTripBelonging>);
  @override
  _i7.Future<List<_i5.AddedTripBelonging>> fetchTripBelongings(int? tripId) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchTripBelongings,
          [tripId],
        ),
        returnValue: _i7.Future<List<_i5.AddedTripBelonging>>.value(
            <_i5.AddedTripBelonging>[]),
      ) as _i7.Future<List<_i5.AddedTripBelonging>>);
  @override
  _i7.Future<_i5.AddedTripBelonging> changeBelongingCheckStatus(
          {required _i5.AddedTripBelonging? belonging}) =>
      (super.noSuchMethod(
        Invocation.method(
          #changeBelongingCheckStatus,
          [],
          {#belonging: belonging},
        ),
        returnValue:
            _i7.Future<_i5.AddedTripBelonging>.value(_FakeAddedTripBelonging_3(
          this,
          Invocation.method(
            #changeBelongingCheckStatus,
            [],
            {#belonging: belonging},
          ),
        )),
      ) as _i7.Future<_i5.AddedTripBelonging>);
}
