// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_User',
      json,
      ($checkedConvert) {
        final val = _$_User(
          id: $checkedConvert('id', (v) => v as int),
          authUid: $checkedConvert('auth_uid', (v) => v as String),
          authProvider: $checkedConvert('auth_provider', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'authUid': 'auth_uid',
        'authProvider': 'auth_provider'
      },
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'auth_uid': instance.authUid,
      'auth_provider': instance.authProvider,
      'name': instance.name,
      'email': instance.email,
    };
