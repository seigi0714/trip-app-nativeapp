// Mocks generated by Mockito 5.4.0 from annotations
// in trip_app_nativeapp/test/feature/user/domain/user_interactor_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:trip_app_nativeapp/core/http/api_client/abstract_api_client.dart'
    as _i2;
import 'package:trip_app_nativeapp/features/user/data/repositories/user_repository.dart'
    as _i4;
import 'package:trip_app_nativeapp/features/user/domain/entity/app_user.dart'
    as _i3;

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

class _FakeAppUser_1 extends _i1.SmartFake implements _i3.AppUser {
  _FakeAppUser_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i4.UserRepository {
  MockUserRepository() {
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
  _i5.Future<_i3.AppUser> fetchUser() => (super.noSuchMethod(
        Invocation.method(
          #fetchUser,
          [],
        ),
        returnValue: _i5.Future<_i3.AppUser>.value(_FakeAppUser_1(
          this,
          Invocation.method(
            #fetchUser,
            [],
          ),
        )),
      ) as _i5.Future<_i3.AppUser>);
}
