import 'dart:convert';

import 'package:flutter/foundation.dart';

class FieldInfo {
  final String label;
  final String hint;
  final List<String> optionsList;
  FieldInfo({
    required this.label,
    required this.hint,
    required this.optionsList,
  });

  FieldInfo copyWith({
    String? label,
    String? hint,
    List<String>? optionsList,
  }) {
    return FieldInfo(
      label: label ?? this.label,
      hint: hint ?? this.hint,
      optionsList: optionsList ?? this.optionsList,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'label': label});
    result.addAll({'hint': hint});
    result.addAll({'optionsList': optionsList});
  
    return result;
  }

  factory FieldInfo.fromMap(Map<String, dynamic> map) {
    return FieldInfo(
      label: map['label'] ?? '',
      hint: map['hint'] ?? '',
      optionsList: List<String>.from(map['optionsList']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FieldInfo.fromJson(String source) =>
      FieldInfo.fromMap(json.decode(source));

  @override
  String toString() => 'FieldInfo(label: $label, hint: $hint, optionsList: $optionsList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FieldInfo &&
      other.label == label &&
      other.hint == hint &&
      listEquals(other.optionsList, optionsList);
  }

  @override
  int get hashCode => label.hashCode ^ hint.hashCode ^ optionsList.hashCode;
}
