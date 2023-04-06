// Mocks generated by Mockito 5.3.2 from annotations
// in trip_app_nativeapp/test/feature/trips/domain/trip_interactor_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:mockito/mockito.dart' as _i1;
import 'package:trip_app_nativeapp/core/http/api_client/abstract_api_client.dart'
    as _i2;
import 'package:trip_app_nativeapp/features/trips/data/repositories/trip_repository.dart'
    as _i6;
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart'
    as _i3;
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_belonging.dart'
    as _i5;
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_invitation.dart'
    as _i4;

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

class _FakeAbstractApiClient_0 extends _i1.SmartFake
    implements _i2.AbstractApiClient {
  _FakeAbstractApiClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTrip_1 extends _i1.SmartFake implements _i3.Trip {
  _FakeTrip_1(
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

class _FakeDetailTripInvitation_3 extends _i1.SmartFake
    implements _i4.DetailTripInvitation {
  _FakeDetailTripInvitation_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddedTripBelonging_4 extends _i1.SmartFake
    implements _i5.AddedTripBelonging {
  _FakeAddedTripBelonging_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TripRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTripRepository extends _i1.Mock implements _i6.TripRepository {
  MockTripRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AbstractApiClient get privateV1Client => (super.noSuchMethod(
        Invocation.getter(#privateV1Client),
        returnValue: _FakeAbstractApiClient_0(
          this,
          Invocation.getter(#privateV1Client),
        ),
      ) as _i2.AbstractApiClient);
  @override
  _i7.Future<List<_i3.Trip>> fetchTripsByUserId(int? userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchTripsByUserId,
          [userId],
        ),
        returnValue: _i7.Future<List<_i3.Trip>>.value(<_i3.Trip>[]),
      ) as _i7.Future<List<_i3.Trip>>);
  @override
  _i7.Future<_i3.Trip> createTrip(_i3.Trip? trip) => (super.noSuchMethod(
        Invocation.method(
          #createTrip,
          [trip],
        ),
        returnValue: _i7.Future<_i3.Trip>.value(_FakeTrip_1(
          this,
          Invocation.method(
            #createTrip,
            [trip],
          ),
        )),
      ) as _i7.Future<_i3.Trip>);
  @override
  _i7.Future<_i4.GeneratedTripInvitation> invite(
          _i4.NewTripInvitation? invitation) =>
      (super.noSuchMethod(
        Invocation.method(
          #invite,
          [invitation],
        ),
        returnValue: _i7.Future<_i4.GeneratedTripInvitation>.value(
            _FakeGeneratedTripInvitation_2(
          this,
          Invocation.method(
            #invite,
            [invitation],
          ),
        )),
      ) as _i7.Future<_i4.GeneratedTripInvitation>);
  @override
  _i7.Future<_i4.DetailTripInvitation> getInvitationByCode(String? code) =>
      (super.noSuchMethod(
        Invocation.method(
          #getInvitationByCode,
          [code],
        ),
        returnValue: _i7.Future<_i4.DetailTripInvitation>.value(
            _FakeDetailTripInvitation_3(
          this,
          Invocation.method(
            #getInvitationByCode,
            [code],
          ),
        )),
      ) as _i7.Future<_i4.DetailTripInvitation>);
  @override
  _i7.Future<_i5.AddedTripBelonging> addTripBelonging(
    int? tripId,
    _i5.NewTripBelonging? belonging,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addTripBelonging,
          [
            tripId,
            belonging,
          ],
        ),
        returnValue:
            _i7.Future<_i5.AddedTripBelonging>.value(_FakeAddedTripBelonging_4(
          this,
          Invocation.method(
            #addTripBelonging,
            [
              tripId,
              belonging,
            ],
          ),
        )),
      ) as _i7.Future<_i5.AddedTripBelonging>);
}
