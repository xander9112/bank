// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvoiceDTO _$InvoiceDTOFromJson(Map<String, dynamic> json) {
  return _InvoiceDTO.fromJson(json);
}

/// @nodoc
mixin _$InvoiceDTO {
  String get account => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String? get parentLogin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceDTOCopyWith<InvoiceDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDTOCopyWith<$Res> {
  factory $InvoiceDTOCopyWith(
          InvoiceDTO value, $Res Function(InvoiceDTO) then) =
      _$InvoiceDTOCopyWithImpl<$Res, InvoiceDTO>;
  @useResult
  $Res call({String account, int count, String currency, String? parentLogin});
}

/// @nodoc
class _$InvoiceDTOCopyWithImpl<$Res, $Val extends InvoiceDTO>
    implements $InvoiceDTOCopyWith<$Res> {
  _$InvoiceDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? count = null,
    Object? currency = null,
    Object? parentLogin = freezed,
  }) {
    return _then(_value.copyWith(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      parentLogin: freezed == parentLogin
          ? _value.parentLogin
          : parentLogin // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceDTOImplCopyWith<$Res>
    implements $InvoiceDTOCopyWith<$Res> {
  factory _$$InvoiceDTOImplCopyWith(
          _$InvoiceDTOImpl value, $Res Function(_$InvoiceDTOImpl) then) =
      __$$InvoiceDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String account, int count, String currency, String? parentLogin});
}

/// @nodoc
class __$$InvoiceDTOImplCopyWithImpl<$Res>
    extends _$InvoiceDTOCopyWithImpl<$Res, _$InvoiceDTOImpl>
    implements _$$InvoiceDTOImplCopyWith<$Res> {
  __$$InvoiceDTOImplCopyWithImpl(
      _$InvoiceDTOImpl _value, $Res Function(_$InvoiceDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? count = null,
    Object? currency = null,
    Object? parentLogin = freezed,
  }) {
    return _then(_$InvoiceDTOImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      parentLogin: freezed == parentLogin
          ? _value.parentLogin
          : parentLogin // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceDTOImpl extends _InvoiceDTO {
  const _$InvoiceDTOImpl(
      {required this.account,
      this.count = 0,
      this.currency = '₽',
      this.parentLogin})
      : super._();

  factory _$InvoiceDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceDTOImplFromJson(json);

  @override
  final String account;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final String currency;
  @override
  final String? parentLogin;

  @override
  String toString() {
    return 'InvoiceDTO(account: $account, count: $count, currency: $currency, parentLogin: $parentLogin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceDTOImpl &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.parentLogin, parentLogin) ||
                other.parentLogin == parentLogin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, account, count, currency, parentLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceDTOImplCopyWith<_$InvoiceDTOImpl> get copyWith =>
      __$$InvoiceDTOImplCopyWithImpl<_$InvoiceDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceDTOImplToJson(
      this,
    );
  }
}

abstract class _InvoiceDTO extends InvoiceDTO {
  const factory _InvoiceDTO(
      {required final String account,
      final int count,
      final String currency,
      final String? parentLogin}) = _$InvoiceDTOImpl;
  const _InvoiceDTO._() : super._();

  factory _InvoiceDTO.fromJson(Map<String, dynamic> json) =
      _$InvoiceDTOImpl.fromJson;

  @override
  String get account;
  @override
  int get count;
  @override
  String get currency;
  @override
  String? get parentLogin;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceDTOImplCopyWith<_$InvoiceDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
