import 'dart:convert';

class CapitalInfo {
  String timestamp;
  final int quantity;
  final String offer;
  final String region;

  CapitalInfo({
    required this.timestamp,
    required this.quantity,
    required this.offer,
    required this.region,
  });

  bool get isValid => quantity > 0 && quantity < 31;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'timestamp': timestamp});
    result.addAll({'quantity': quantity});
    result.addAll({'offer': offer});
    result.addAll({'region': region});
  
    return result;
  }

  factory CapitalInfo.fromMap(Map<String, dynamic> map) {
    return CapitalInfo(
      timestamp: map['timestamp'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
      offer: map['offer'] ?? '',
      region: map['region'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CapitalInfo.fromJson(String source) =>
      CapitalInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CapitalInfo(timestamp: $timestamp, quantity: $quantity, offer: $offer, region: $region)';
  }

  CapitalInfo copyWith({
    String? timestamp,
    int? quantity,
    String? offer,
    String? region,
  }) {
    return CapitalInfo(
      timestamp: timestamp ?? this.timestamp,
      quantity: quantity ?? this.quantity,
      offer: offer ?? this.offer,
      region: region ?? this.region,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CapitalInfo &&
      other.timestamp == timestamp &&
      other.quantity == quantity &&
      other.offer == offer &&
      other.region == region;
  }

  @override
  int get hashCode {
    return timestamp.hashCode ^
      quantity.hashCode ^
      offer.hashCode ^
      region.hashCode;
  }
}
