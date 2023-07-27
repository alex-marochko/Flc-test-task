// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      appMode: $enumDecodeNullable(_$AppModeEnumMap, json['appMode']),
      birthYear: json['birthYear'] as int?,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'appMode': _$AppModeEnumMap[instance.appMode],
      'birthYear': instance.birthYear,
    };

const _$AppModeEnumMap = {
  AppMode.periodTracking: 'periodTracking',
  AppMode.getPregnant: 'getPregnant',
};
