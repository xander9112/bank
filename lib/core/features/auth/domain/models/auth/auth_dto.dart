import 'package:bank/core/_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_dto.freezed.dart';
part 'auth_dto.g.dart';

@freezed
class AuthDTO with _$AuthDTO {
  const factory AuthDTO({
    required String token,
    required UserDTO user,
  }) = _AuthDTO;

  factory AuthDTO.fromJson(Object? json) =>
      _$AuthDTOFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
