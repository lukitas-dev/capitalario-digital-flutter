import 'dart:convert';

class RankingItemInfo {
  final String name;
  final int quantity;
  RankingItemInfo({
    required this.name,
    required this.quantity,
  });

  RankingItemInfo copyWith({
    String? name,
    int? quantity,
  }) {
    return RankingItemInfo(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'quantity': quantity});
  
    return result;
  }

  factory RankingItemInfo.fromMap(Map<String, dynamic> map) {
    return RankingItemInfo(
      name: map['name'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RankingItemInfo.fromJson(String source) => RankingItemInfo.fromMap(json.decode(source));

  @override
  String toString() => 'RankingItemInfo(name: $name, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RankingItemInfo &&
      other.name == name &&
      other.quantity == quantity;
  }

  @override
  int get hashCode => name.hashCode ^ quantity.hashCode;
}
