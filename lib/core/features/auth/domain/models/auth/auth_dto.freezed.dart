// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthDTO _$AuthDTOFromJson(Map<String, dynamic> json) {
  return _AuthDTO.fromJson(json);
}

/// @nodoc
mixin _$AuthDTO {
  String get token => throw _privateConstructorUsedError;
  UserDTO get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthDTOCopyWith<AuthDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthDTOCopyWith<$Res> {
  factory $AuthDTOCopyWith(AuthDTO value, $Res Function(AuthDTO) then) =
      _$AuthDTOCopyWithImpl<$Res, AuthDTO>;
  @useResult
  $Res call({String token, UserDTO user});

  $UserDTOCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthDTOCopyWithImpl<$Res, $Val extends AuthDTO>
    implements $AuthDTOCopyWith<$Res> {
  _$AuthDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDTO,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDTOCopyWith<$Res> get user {
    return $UserDTOCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthDTOImplCopyWith<$Res> implements $AuthDTOCopyWith<$Res> {
  factory _$$AuthDTOImplCopyWith(
          _$AuthDTOImpl value, $Res Function(_$AuthDTOImpl) then) =
      __$$AuthDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, UserDTO user});

  @override
  $UserDTOCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthDTOImplCopyWithImpl<$Res>
    extends _$AuthDTOCopyWithImpl<$Res, _$AuthDTOImpl>
    implements _$$AuthDTOImplCopyWith<$Res> {
  __$$AuthDTOImplCopyWithImpl(
      _$AuthDTOImpl _value, $Res Function(_$AuthDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? user = null,
  }) {
    return _then(_$AuthDTOImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthDTOImpl implements _AuthDTO {
  const _$AuthDTOImpl({required this.token, required this.user});

  factory _$AuthDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthDTOImplFromJson(json);

  @override
  final String token;
  @override
  final UserDTO user;

  @override
  String toString() {
    return 'AuthDTO(token: $token, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthDTOImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthDTOImplCopyWith<_$AuthDTOImpl> get copyWith =>
      __$$AuthDTOImplCopyWithImpl<_$AuthDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthDTOImplToJson(
      this,
    );
  }
}

abstract class _AuthDTO implements AuthDTO {
  const factory _AuthDTO(
      {required final String token,
      required final UserDTO user}) = _$AuthDTOImpl;

  factory _AuthDTO.fromJson(Map<String, dynamic> json) = _$AuthDTOImpl.fromJson;

  @override
  String get token;
  @override
  UserDTO get user;
  @override
  @JsonKey(ignore: true)
  _$$AuthDTOImplCopyWith<_$AuthDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
