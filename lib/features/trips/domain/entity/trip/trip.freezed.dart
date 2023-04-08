// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Trip {
  TripTitle get title => throw _privateConstructorUsedError;
  TripPeriod get period => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TripTitle title, TripPeriod period) createNewTrip,
    required TResult Function(int id, TripTitle title, TripPeriod period,
            List<TripMember> members, List<AddedTripBelonging> belongings)
        createExistingTrip,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TripTitle title, TripPeriod period)? createNewTrip,
    TResult? Function(int id, TripTitle title, TripPeriod period,
            List<TripMember> members, List<AddedTripBelonging> belongings)?
        createExistingTrip,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TripTitle title, TripPeriod period)? createNewTrip,
    TResult Function(int id, TripTitle title, TripPeriod period,
            List<TripMember> members, List<AddedTripBelonging> belongings)?
        createExistingTrip,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewTrip value) createNewTrip,
    required TResult Function(ExistingTrip value) createExistingTrip,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewTrip value)? createNewTrip,
    TResult? Function(ExistingTrip value)? createExistingTrip,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewTrip value)? createNewTrip,
    TResult Function(ExistingTrip value)? createExistingTrip,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$NewTrip implements NewTrip {
  _$NewTrip({required this.title, required this.period});

  @override
  final TripTitle title;
  @override
  final TripPeriod period;

  @override
  String toString() {
    return 'Trip.createNewTrip(title: $title, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewTrip &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, period);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TripTitle title, TripPeriod period) createNewTrip,
    required TResult Function(int id, TripTitle title, TripPeriod period,
            List<TripMember> members, List<AddedTripBelonging> belongings)
        createExistingTrip,
  }) {
    return createNewTrip(title, period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TripTitle title, TripPeriod period)? createNewTrip,
    TResult? Function(int id, TripTitle title, TripPeriod period,
            List<TripMember> members, List<AddedTripBelonging> belongings)?
        createExistingTrip,
  }) {
    return createNewTrip?.call(title, period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TripTitle title, TripPeriod period)? createNewTrip,
    TResult Function(int id, TripTitle title, TripPeriod period,
            List<TripMember> members, List<AddedTripBelonging> belongings)?
        createExistingTrip,
    required TResult orElse(),
  }) {
    if (createNewTrip != null) {
      return createNewTrip(title, period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewTrip value) createNewTrip,
    required TResult Function(ExistingTrip value) createExistingTrip,
  }) {
    return createNewTrip(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewTrip value)? createNewTrip,
    TResult? Function(ExistingTrip value)? createExistingTrip,
  }) {
    return createNewTrip?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewTrip value)? createNewTrip,
    TResult Function(ExistingTrip value)? createExistingTrip,
    required TResult orElse(),
  }) {
    if (createNewTrip != null) {
      return createNewTrip(this);
    }
    return orElse();
  }
}

abstract class NewTrip implements Trip {
  factory NewTrip(
      {required final TripTitle title,
      required final TripPeriod period}) = _$NewTrip;

  @override
  TripTitle get title;
  @override
  TripPeriod get period;
}

/// @nodoc

class _$ExistingTrip implements ExistingTrip {
  _$ExistingTrip(
      {required this.id,
      required this.title,
      required this.period,
      required final List<TripMember> members,
      required final List<AddedTripBelonging> belongings})
      : _members = members,
        _belongings = belongings;

  @override
  final int id;
  @override
  final TripTitle title;
  @override
  final TripPeriod period;
  final List<TripMember> _members;
  @override
  List<TripMember> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<AddedTripBelonging> _belongings;
  @override
  List<AddedTripBelonging> get belongings {
    if (_belongings is EqualUnmodifiableListView) return _belongings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_belongings);
  }

  @override
  String toString() {
    return 'Trip.createExistingTrip(id: $id, title: $title, period: $period, members: $members, belongings: $belongings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExistingTrip &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality()
                .equals(other._belongings, _belongings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      period,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_belongings));

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TripTitle title, TripPeriod period) createNewTrip,
    required TResult Function(int id, TripTitle title, TripPeriod period,
            List<TripMember> members, List<AddedTripBelonging> belongings)
        createExistingTrip,
  }) {
    return createExistingTrip(id, title, period, members, belongings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TripTitle title, TripPeriod period)? createNewTrip,
    TResult? Function(int id, TripTitle title, TripPeriod period,
            List<TripMember> members, List<AddedTripBelonging> belongings)?
        createExistingTrip,
  }) {
    return createExistingTrip?.call(id, title, period, members, belongings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TripTitle title, TripPeriod period)? createNewTrip,
    TResult Function(int id, TripTitle title, TripPeriod period,
            List<TripMember> members, List<AddedTripBelonging> belongings)?
        createExistingTrip,
    required TResult orElse(),
  }) {
    if (createExistingTrip != null) {
      return createExistingTrip(id, title, period, members, belongings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewTrip value) createNewTrip,
    required TResult Function(ExistingTrip value) createExistingTrip,
  }) {
    return createExistingTrip(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewTrip value)? createNewTrip,
    TResult? Function(ExistingTrip value)? createExistingTrip,
  }) {
    return createExistingTrip?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewTrip value)? createNewTrip,
    TResult Function(ExistingTrip value)? createExistingTrip,
    required TResult orElse(),
  }) {
    if (createExistingTrip != null) {
      return createExistingTrip(this);
    }
    return orElse();
  }
}

abstract class ExistingTrip implements Trip {
  factory ExistingTrip(
      {required final int id,
      required final TripTitle title,
      required final TripPeriod period,
      required final List<TripMember> members,
      required final List<AddedTripBelonging> belongings}) = _$ExistingTrip;

  int get id;
  @override
  TripTitle get title;
  @override
  TripPeriod get period;
  List<TripMember> get members;
  List<AddedTripBelonging> get belongings;
}
