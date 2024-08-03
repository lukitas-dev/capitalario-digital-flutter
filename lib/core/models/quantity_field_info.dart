import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/core/models/quantity_option.dart';

class QuantityFieldInfo {
  final String label;
  final List<QuantityOption> optionList;
  final bool showDeleteButton;
  final int maxValue;
  final String hint;
  QuantityFieldInfo({
    required this.label,
    required this.optionList,
    required this.showDeleteButton,
    required this.maxValue,
    required this.hint,
  });

  QuantityFieldInfo copyWith({
    String? label,
    List<QuantityOption>? optionList,
    bool? showDeleteButton,
    int? maxValue,
    String? hint,
  }) {
    return QuantityFieldInfo(
      label: label ?? this.label,
      optionList: optionList ?? this.optionList,
      showDeleteButton: showDeleteButton ?? this.showDeleteButton,
      maxValue: maxValue ?? this.maxValue,
      hint: hint ?? this.hint,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'label': label});
    result.addAll({'optionList': optionList.map((x) => x.toMap()).toList()});
    result.addAll({'showDeleteButton': showDeleteButton});
    result.addAll({'maxValue': maxValue});
    result.addAll({'hint': hint});
  
    return result;
  }

  factory QuantityFieldInfo.fromMap(Map<String, dynamic> map) {
    return QuantityFieldInfo(
      label: map['label'] ?? '',
      optionList: List<QuantityOption>.from(map['optionList']?.map((x) => QuantityOption.fromMap(x))),
      showDeleteButton: map['showDeleteButton'] ?? false,
      maxValue: map['maxValue']?.toInt() ?? 0,
      hint: map['hint'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory QuantityFieldInfo.fromJson(String source) =>
      QuantityFieldInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuantityFieldInfo(label: $label, optionList: $optionList, showDeleteButton: $showDeleteButton, maxValue: $maxValue, hint: $hint)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is QuantityFieldInfo &&
      other.label == label &&
      listEquals(other.optionList, optionList) &&
      other.showDeleteButton == showDeleteButton &&
      other.maxValue == maxValue &&
      other.hint == hint;
  }

  @override
  int get hashCode {
    return label.hashCode ^
      optionList.hashCode ^
      showDeleteButton.hashCode ^
      maxValue.hashCode ^
      hint.hashCode;
  }
}
