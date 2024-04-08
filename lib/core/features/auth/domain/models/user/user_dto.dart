import 'package:bank/core/features/auth/_auth.dart';
import 'package:bank/features/_features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    required String firstName,
    required String lastName,
    required String login,
    String? parentLogin,
    InvoiceDTO? invoice,
  }) = _UserDTO;

  const UserDTO._();

  factory UserDTO.fromJson(Object? json) =>
      _$UserDTOFromJson(json! as Map<String, dynamic>);

  factory UserDTO.empty() =>
      const UserDTO(firstName: 'test', lastName: 'test', login: 'test');

  @override
  Map<String, dynamic> toJson();

  String get fullName => '$lastName $firstName';

  UserRole get role => parentLogin == null ? UserRole.parent : UserRole.child;
}
