import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_dto.freezed.dart';
part 'invoice_dto.g.dart';

@freezed
class InvoiceDTO with _$InvoiceDTO {
  const factory InvoiceDTO({
    required String account,
    @Default(0) int count,
    @Default('₽') String currency,
    String? parentLogin,
  }) = _InvoiceDTO;

  const InvoiceDTO._();

  factory InvoiceDTO.fromJson(Object? json) =>
      _$InvoiceDTOFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();

  String get maskedAccount {
    return '${account.substring(0, 4)} **** **** ${account.substring(12)}';
  }
}
