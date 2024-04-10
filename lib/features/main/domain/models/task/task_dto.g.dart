// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskDTOImpl _$$TaskDTOImplFromJson(Map<String, dynamic> json) =>
    _$TaskDTOImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      createAt: DateTime.parse(json['createAt'] as String),
      status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']) ??
          TaskStatus.created,
    );

Map<String, dynamic> _$$TaskDTOImplToJson(_$TaskDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'createAt': instance.createAt.toIso8601String(),
      'status': _$TaskStatusEnumMap[instance.status]!,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.created: 'created',
  TaskStatus.done: 'done',
  TaskStatus.confirmed: 'confirmed',
  TaskStatus.declined: 'declined',
};
