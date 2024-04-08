// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthDTOImpl _$$AuthDTOImplFromJson(Map<String, dynamic> json) =>
    _$AuthDTOImpl(
      token: json['token'] as String,
      user: UserDTO.fromJson(json['user']),
    );

Map<String, dynamic> _$$AuthDTOImplToJson(_$AuthDTOImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };
