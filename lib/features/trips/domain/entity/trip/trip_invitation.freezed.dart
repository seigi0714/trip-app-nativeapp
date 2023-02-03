// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trip_invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TripInvitation {
  int get tripId => throw _privateConstructorUsedError;
  TripInvitationNum get invitationNum => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int tripId, TripInvitationNum invitationNum)
        createNewTripInvitation,
    required TResult Function(
            int tripId, TripInvitationNum invitationNum, String invitationCode)
        createGeneratedTripInvitation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int tripId, TripInvitationNum invitationNum)?
        createNewTripInvitation,
    TResult? Function(
            int tripId, TripInvitationNum invitationNum, String invitationCode)?
        createGeneratedTripInvitation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int tripId, TripInvitationNum invitationNum)?
        createNewTripInvitation,
    TResult Function(
            int tripId, TripInvitationNum invitationNum, String invitationCode)?
        createGeneratedTripInvitation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewTripInvitation value) createNewTripInvitation,
    required TResult Function(GeneratedTripInvitation value)
        createGeneratedTripInvitation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewTripInvitation value)? createNewTripInvitation,
    TResult? Function(GeneratedTripInvitation value)?
        createGeneratedTripInvitation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewTripInvitation value)? createNewTripInvitation,
    TResult Function(GeneratedTripInvitation value)?
        createGeneratedTripInvitation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$NewTripInvitation implements NewTripInvitation {
  _$NewTripInvitation({required this.tripId, required this.invitationNum});

  @override
  final int tripId;
  @override
  final TripInvitationNum invitationNum;

  @override
  String toString() {
    return 'TripInvitation.createNewTripInvitation(tripId: $tripId, invitationNum: $invitationNum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewTripInvitation &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.invitationNum, invitationNum) ||
                other.invitationNum == invitationNum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tripId, invitationNum);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int tripId, TripInvitationNum invitationNum)
        createNewTripInvitation,
    required TResult Function(
            int tripId, TripInvitationNum invitationNum, String invitationCode)
        createGeneratedTripInvitation,
  }) {
    return createNewTripInvitation(tripId, invitationNum);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int tripId, TripInvitationNum invitationNum)?
        createNewTripInvitation,
    TResult? Function(
            int tripId, TripInvitationNum invitationNum, String invitationCode)?
        createGeneratedTripInvitation,
  }) {
    return createNewTripInvitation?.call(tripId, invitationNum);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int tripId, TripInvitationNum invitationNum)?
        createNewTripInvitation,
    TResult Function(
            int tripId, TripInvitationNum invitationNum, String invitationCode)?
        createGeneratedTripInvitation,
    required TResult orElse(),
  }) {
    if (createNewTripInvitation != null) {
      return createNewTripInvitation(tripId, invitationNum);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewTripInvitation value) createNewTripInvitation,
    required TResult Function(GeneratedTripInvitation value)
        createGeneratedTripInvitation,
  }) {
    return createNewTripInvitation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewTripInvitation value)? createNewTripInvitation,
    TResult? Function(GeneratedTripInvitation value)?
        createGeneratedTripInvitation,
  }) {
    return createNewTripInvitation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewTripInvitation value)? createNewTripInvitation,
    TResult Function(GeneratedTripInvitation value)?
        createGeneratedTripInvitation,
    required TResult orElse(),
  }) {
    if (createNewTripInvitation != null) {
      return createNewTripInvitation(this);
    }
    return orElse();
  }
}

abstract class NewTripInvitation implements TripInvitation {
  factory NewTripInvitation(
      {required final int tripId,
      required final TripInvitationNum invitationNum}) = _$NewTripInvitation;

  @override
  int get tripId;
  @override
  TripInvitationNum get invitationNum;
}

/// @nodoc

class _$GeneratedTripInvitation implements GeneratedTripInvitation {
  _$GeneratedTripInvitation(
      {required this.tripId,
      required this.invitationNum,
      required this.invitationCode});

  @override
  final int tripId;
  @override
  final TripInvitationNum invitationNum;
  @override
  final String invitationCode;

  @override
  String toString() {
    return 'TripInvitation.createGeneratedTripInvitation(tripId: $tripId, invitationNum: $invitationNum, invitationCode: $invitationCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratedTripInvitation &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.invitationNum, invitationNum) ||
                other.invitationNum == invitationNum) &&
            (identical(other.invitationCode, invitationCode) ||
                other.invitationCode == invitationCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, tripId, invitationNum, invitationCode);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int tripId, TripInvitationNum invitationNum)
        createNewTripInvitation,
    required TResult Function(
            int tripId, TripInvitationNum invitationNum, String invitationCode)
        createGeneratedTripInvitation,
  }) {
    return createGeneratedTripInvitation(tripId, invitationNum, invitationCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int tripId, TripInvitationNum invitationNum)?
        createNewTripInvitation,
    TResult? Function(
            int tripId, TripInvitationNum invitationNum, String invitationCode)?
        createGeneratedTripInvitation,
  }) {
    return createGeneratedTripInvitation?.call(
        tripId, invitationNum, invitationCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int tripId, TripInvitationNum invitationNum)?
        createNewTripInvitation,
    TResult Function(
            int tripId, TripInvitationNum invitationNum, String invitationCode)?
        createGeneratedTripInvitation,
    required TResult orElse(),
  }) {
    if (createGeneratedTripInvitation != null) {
      return createGeneratedTripInvitation(
          tripId, invitationNum, invitationCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewTripInvitation value) createNewTripInvitation,
    required TResult Function(GeneratedTripInvitation value)
        createGeneratedTripInvitation,
  }) {
    return createGeneratedTripInvitation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewTripInvitation value)? createNewTripInvitation,
    TResult? Function(GeneratedTripInvitation value)?
        createGeneratedTripInvitation,
  }) {
    return createGeneratedTripInvitation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewTripInvitation value)? createNewTripInvitation,
    TResult Function(GeneratedTripInvitation value)?
        createGeneratedTripInvitation,
    required TResult orElse(),
  }) {
    if (createGeneratedTripInvitation != null) {
      return createGeneratedTripInvitation(this);
    }
    return orElse();
  }
}

abstract class GeneratedTripInvitation implements TripInvitation {
  factory GeneratedTripInvitation(
      {required final int tripId,
      required final TripInvitationNum invitationNum,
      required final String invitationCode}) = _$GeneratedTripInvitation;

  @override
  int get tripId;
  @override
  TripInvitationNum get invitationNum;
  String get invitationCode;
}
