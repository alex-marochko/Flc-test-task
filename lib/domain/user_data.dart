import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

enum RegistrationStage { appMode, birthYear, results }

enum AppMode { periodTracking, getPregnant }

@freezed
class UserData with _$UserData {
  @Assert('birthYear == null || birthYear > 1900', 'Wrong year of birth')
  @Assert('birthYear == null || birthYear < DateTime.now().year',
      'Wrong year of birth')
  const factory UserData({
    RegistrationStage? stage,
    AppMode? appMode,
    int? birthYear,
  }) = _UserData;

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);
}
