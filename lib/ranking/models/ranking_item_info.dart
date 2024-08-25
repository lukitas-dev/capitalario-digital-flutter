import 'dart:convert';

class RankingItemInfo {
  final String id;
  final String label;
  final String description;
  final int quantity;
  RankingItemInfo({
    required this.id,
    required this.label,
    required this.description,
    required this.quantity,
  });

  RankingItemInfo copyWith({
    String? id,
    String? label,
    String? description,
    int? quantity,
  }) {
    return RankingItemInfo(
      id: id ?? this.id,
      label: label ?? this.label,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'label': label});
    result.addAll({'description': description});
    result.addAll({'quantity': quantity});
  
    return result;
  }

  factory RankingItemInfo.fromMap(Map<String, dynamic> map) {
    return RankingItemInfo(
      id: map['id'] ?? '',
      label: map['label'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RankingItemInfo.fromJson(String source) =>
      RankingItemInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RankingItemInfo(id: $id, label: $label, description: $description, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RankingItemInfo &&
      other.id == id &&
      other.label == label &&
      other.description == description &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      label.hashCode ^
      description.hashCode ^
      quantity.hashCode;
  }
}
