import 'dart:convert';

class QuantityOption {
  final String description;
  final int value;
  QuantityOption({
    required this.description,
    required this.value,
  });

  QuantityOption copyWith({
    String? description,
    int? value,
  }) {
    return QuantityOption(
      description: description ?? this.description,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'description': description});
    result.addAll({'value': value});
  
    return result;
  }

  factory QuantityOption.fromMap(Map<String, dynamic> map) {
    return QuantityOption(
      description: map['description'] ?? '',
      value: map['value']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuantityOption.fromJson(String source) => QuantityOption.fromMap(json.decode(source));

  @override
  String toString() => 'QuantityOption(description: $description, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is QuantityOption &&
      other.description == description &&
      other.value == value;
  }

  @override
  int get hashCode => description.hashCode ^ value.hashCode;
}
