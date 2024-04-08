// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDTOImpl _$$UserDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserDTOImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      login: json['login'] as String,
      parentLogin: json['parentLogin'] as String?,
      invoice:
          json['invoice'] == null ? null : InvoiceDTO.fromJson(json['invoice']),
    );

Map<String, dynamic> _$$UserDTOImplToJson(_$UserDTOImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'login': instance.login,
      'parentLogin': instance.parentLogin,
      'invoice': instance.invoice,
    };
