import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nabi_app/enum/login_type.dart';

part 'sign_up_transmission_model.freezed.dart';

part 'sign_up_transmission_model.g.dart';

@freezed
class SignUpTransmissionModel with _$SignUpTransmissionModel {
  factory SignUpTransmissionModel({
    required String email,
    required LoginType loginType,
  }) = _SignUpTransmissionModel;

  factory SignUpTransmissionModel.fromJson(Map<String, dynamic> json) => _$SignUpTransmissionModelFromJson(json);
}
