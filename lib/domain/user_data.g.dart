// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      stage: $enumDecodeNullable(_$RegistrationStageEnumMap, json['stage']),
      appMode: $enumDecodeNullable(_$AppModeEnumMap, json['appMode']),
      birthYear: json['birthYear'] as int?,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'stage': _$RegistrationStageEnumMap[instance.stage],
      'appMode': _$AppModeEnumMap[instance.appMode],
      'birthYear': instance.birthYear,
    };

const _$RegistrationStageEnumMap = {
  RegistrationStage.appMode: 'appMode',
  RegistrationStage.birthYear: 'birthYear',
  RegistrationStage.results: 'results',
};

const _$AppModeEnumMap = {
  AppMode.periodTracking: 'periodTracking',
  AppMode.getPregnant: 'getPregnant',
};
