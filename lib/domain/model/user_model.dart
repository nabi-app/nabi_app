import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nabi_app/enum/login_type.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required DateTime createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    required int userId,
    String? email,
    required String nickname,
    String? profileImage,
    required bool marketingConsent,
    required LoginType provider,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
