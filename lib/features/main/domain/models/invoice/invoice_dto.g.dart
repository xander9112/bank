// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceDTOImpl _$$InvoiceDTOImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceDTOImpl(
      account: json['account'] as String,
      count: json['count'] as int? ?? 0,
      currency: json['currency'] as String? ?? '₽',
      parentLogin: json['parentLogin'] as String?,
    );

Map<String, dynamic> _$$InvoiceDTOImplToJson(_$InvoiceDTOImpl instance) =>
    <String, dynamic>{
      'account': instance.account,
      'count': instance.count,
      'currency': instance.currency,
      'parentLogin': instance.parentLogin,
    };
