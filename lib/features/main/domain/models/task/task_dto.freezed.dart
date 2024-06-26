// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskDTO _$TaskDTOFromJson(Map<String, dynamic> json) {
  return _TaskDTO.fromJson(json);
}

/// @nodoc
mixin _$TaskDTO {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  DateTime get createAt => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskDTOCopyWith<TaskDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDTOCopyWith<$Res> {
  factory $TaskDTOCopyWith(TaskDTO value, $Res Function(TaskDTO) then) =
      _$TaskDTOCopyWithImpl<$Res, TaskDTO>;
  @useResult
  $Res call(
      {String id,
      String name,
      int price,
      DateTime createAt,
      TaskStatus status});
}

/// @nodoc
class _$TaskDTOCopyWithImpl<$Res, $Val extends TaskDTO>
    implements $TaskDTOCopyWith<$Res> {
  _$TaskDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? createAt = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskDTOImplCopyWith<$Res> implements $TaskDTOCopyWith<$Res> {
  factory _$$TaskDTOImplCopyWith(
          _$TaskDTOImpl value, $Res Function(_$TaskDTOImpl) then) =
      __$$TaskDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int price,
      DateTime createAt,
      TaskStatus status});
}

/// @nodoc
class __$$TaskDTOImplCopyWithImpl<$Res>
    extends _$TaskDTOCopyWithImpl<$Res, _$TaskDTOImpl>
    implements _$$TaskDTOImplCopyWith<$Res> {
  __$$TaskDTOImplCopyWithImpl(
      _$TaskDTOImpl _value, $Res Function(_$TaskDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? createAt = null,
    Object? status = null,
  }) {
    return _then(_$TaskDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskDTOImpl implements _TaskDTO {
  const _$TaskDTOImpl(
      {required this.id,
      required this.name,
      required this.price,
      required this.createAt,
      this.status = TaskStatus.created});

  factory _$TaskDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskDTOImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int price;
  @override
  final DateTime createAt;
  @override
  @JsonKey()
  final TaskStatus status;

  @override
  String toString() {
    return 'TaskDTO(id: $id, name: $name, price: $price, createAt: $createAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, price, createAt, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDTOImplCopyWith<_$TaskDTOImpl> get copyWith =>
      __$$TaskDTOImplCopyWithImpl<_$TaskDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskDTOImplToJson(
      this,
    );
  }
}

abstract class _TaskDTO implements TaskDTO {
  const factory _TaskDTO(
      {required final String id,
      required final String name,
      required final int price,
      required final DateTime createAt,
      final TaskStatus status}) = _$TaskDTOImpl;

  factory _TaskDTO.fromJson(Map<String, dynamic> json) = _$TaskDTOImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get price;
  @override
  DateTime get createAt;
  @override
  TaskStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$TaskDTOImplCopyWith<_$TaskDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
