// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_AppUser',
      json,
      ($checkedConvert) {
        final val = _$_AppUser(
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

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'auth_uid': instance.authUid,
      'auth_provider': instance.authProvider,
      'name': instance.name,
      'email': instance.email,
    };
