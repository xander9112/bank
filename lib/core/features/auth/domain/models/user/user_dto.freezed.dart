// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) {
  return _UserDTO.fromJson(json);
}

/// @nodoc
mixin _$UserDTO {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  String? get parentLogin => throw _privateConstructorUsedError;
  InvoiceDTO? get invoice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDTOCopyWith<UserDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDTOCopyWith<$Res> {
  factory $UserDTOCopyWith(UserDTO value, $Res Function(UserDTO) then) =
      _$UserDTOCopyWithImpl<$Res, UserDTO>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String login,
      String? parentLogin,
      InvoiceDTO? invoice});

  $InvoiceDTOCopyWith<$Res>? get invoice;
}

/// @nodoc
class _$UserDTOCopyWithImpl<$Res, $Val extends UserDTO>
    implements $UserDTOCopyWith<$Res> {
  _$UserDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? login = null,
    Object? parentLogin = freezed,
    Object? invoice = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      parentLogin: freezed == parentLogin
          ? _value.parentLogin
          : parentLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice: freezed == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as InvoiceDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InvoiceDTOCopyWith<$Res>? get invoice {
    if (_value.invoice == null) {
      return null;
    }

    return $InvoiceDTOCopyWith<$Res>(_value.invoice!, (value) {
      return _then(_value.copyWith(invoice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDTOImplCopyWith<$Res> implements $UserDTOCopyWith<$Res> {
  factory _$$UserDTOImplCopyWith(
          _$UserDTOImpl value, $Res Function(_$UserDTOImpl) then) =
      __$$UserDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String login,
      String? parentLogin,
      InvoiceDTO? invoice});

  @override
  $InvoiceDTOCopyWith<$Res>? get invoice;
}

/// @nodoc
class __$$UserDTOImplCopyWithImpl<$Res>
    extends _$UserDTOCopyWithImpl<$Res, _$UserDTOImpl>
    implements _$$UserDTOImplCopyWith<$Res> {
  __$$UserDTOImplCopyWithImpl(
      _$UserDTOImpl _value, $Res Function(_$UserDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? login = null,
    Object? parentLogin = freezed,
    Object? invoice = freezed,
  }) {
    return _then(_$UserDTOImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      parentLogin: freezed == parentLogin
          ? _value.parentLogin
          : parentLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice: freezed == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as InvoiceDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDTOImpl extends _UserDTO {
  const _$UserDTOImpl(
      {required this.firstName,
      required this.lastName,
      required this.login,
      this.parentLogin,
      this.invoice})
      : super._();

  factory _$UserDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDTOImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String login;
  @override
  final String? parentLogin;
  @override
  final InvoiceDTO? invoice;

  @override
  String toString() {
    return 'UserDTO(firstName: $firstName, lastName: $lastName, login: $login, parentLogin: $parentLogin, invoice: $invoice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDTOImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.parentLogin, parentLogin) ||
                other.parentLogin == parentLogin) &&
            (identical(other.invoice, invoice) || other.invoice == invoice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, firstName, lastName, login, parentLogin, invoice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDTOImplCopyWith<_$UserDTOImpl> get copyWith =>
      __$$UserDTOImplCopyWithImpl<_$UserDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDTOImplToJson(
      this,
    );
  }
}

abstract class _UserDTO extends UserDTO {
  const factory _UserDTO(
      {required final String firstName,
      required final String lastName,
      required final String login,
      final String? parentLogin,
      final InvoiceDTO? invoice}) = _$UserDTOImpl;
  const _UserDTO._() : super._();

  factory _UserDTO.fromJson(Map<String, dynamic> json) = _$UserDTOImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get login;
  @override
  String? get parentLogin;
  @override
  InvoiceDTO? get invoice;
  @override
  @JsonKey(ignore: true)
  _$$UserDTOImplCopyWith<_$UserDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
