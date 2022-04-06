class InvoiceModel {
  final int invoiceId;
  final String billingAddress;
  final double total;
  InvoiceModel({
    required this.invoiceId,
    required this.billingAddress,
    required this.total,
  });

  factory InvoiceModel.fromMap(Map<String, dynamic> map) {
    return InvoiceModel(
      invoiceId: map['InvoiceId']?.toInt() ?? 0,
      billingAddress: map['BillingAddress'] ?? '',
      total: map['Total']?.toDouble() ?? 0.0,
    );
  }

  @override
  String toString() =>
      'InvoiceModel(invoiceId: $invoiceId, billingAddress: $billingAddress, total: $total)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InvoiceModel &&
        other.invoiceId == invoiceId &&
        other.billingAddress == billingAddress &&
        other.total == total;
  }

  @override
  int get hashCode =>
      invoiceId.hashCode ^ billingAddress.hashCode ^ total.hashCode;
}
