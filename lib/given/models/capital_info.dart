import 'dart:convert';

class CapitalInfo {
  String timestamp;
  final int quantity;
  final String offer;

  CapitalInfo({
    required this.timestamp,
    required this.quantity,
    required this.offer,
  });

  bool get isValid => quantity > 0 && quantity < 31;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'timestamp': timestamp});
    result.addAll({'quantity': quantity});
    result.addAll({'offer': offer});
  
    return result;
  }

  factory CapitalInfo.fromMap(Map<String, dynamic> map) {
    return CapitalInfo(
      timestamp: map['timestamp'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
      offer: map['offer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CapitalInfo.fromJson(String source) =>
      CapitalInfo.fromMap(json.decode(source));

  @override
  String toString() => 'CapitalInfo(timestamp: $timestamp, quantity: $quantity, offer: $offer)';

  CapitalInfo copyWith({
    String? timestamp,
    int? quantity,
    String? offer,
  }) {
    return CapitalInfo(
      timestamp: timestamp ?? this.timestamp,
      quantity: quantity ?? this.quantity,
      offer: offer ?? this.offer,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CapitalInfo &&
      other.timestamp == timestamp &&
      other.quantity == quantity &&
      other.offer == offer;
  }

  @override
  int get hashCode => timestamp.hashCode ^ quantity.hashCode ^ offer.hashCode;
}
