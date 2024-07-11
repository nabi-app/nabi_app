import 'package:freezed_annotation/freezed_annotation.dart';

part 'nickname_duplicate_check_request.freezed.dart';

part 'nickname_duplicate_check_request.g.dart';

@freezed
class NicknameDuplicateCheckRequest with _$NicknameDuplicateCheckRequest {
  factory NicknameDuplicateCheckRequest({
    required String nickname,
  }) = _NicknameDuplicateCheckRequest;

  factory NicknameDuplicateCheckRequest.fromJson(Map<String, dynamic> json) =>
      _$NicknameDuplicateCheckRequestFromJson(json);
}
