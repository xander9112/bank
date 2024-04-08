// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskDTOImpl _$$TaskDTOImplFromJson(Map<String, dynamic> json) =>
    _$TaskDTOImpl(
      name: json['name'] as String,
      price: json['price'] as String,
      status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']) ??
          TaskStatus.created,
    );

Map<String, dynamic> _$$TaskDTOImplToJson(_$TaskDTOImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'status': _$TaskStatusEnumMap[instance.status]!,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.created: 'created',
  TaskStatus.done: 'done',
  TaskStatus.confirmed: 'confirmed',
};
