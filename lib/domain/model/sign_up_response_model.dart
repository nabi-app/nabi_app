import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nabi_app/domain/model/user_model.dart';

part 'sign_up_response_model.freezed.dart';

part 'sign_up_response_model.g.dart';

@freezed
class SignUpResponseModel with _$SignUpResponseModel {
  factory SignUpResponseModel({
    required UserModel user,
    required String accessToken,
    required String refreshToken,
  }) = _SignUpResponseModel;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) => _$SignUpResponseModelFromJson(json);
}
