import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/core/models/alert_info.dart';
import 'package:app/core/models/field_info.dart';

class GivenInfo {
  final String headerImagePath;
  final List<FieldInfo> fieldList;
  final String sendTitleButton;
  final AlertInfo sendAlert;
  GivenInfo({
    required this.headerImagePath,
    required this.fieldList,
    required this.sendTitleButton,
    required this.sendAlert,
  });

  GivenInfo copyWith({
    String? headerImagePath,
    List<FieldInfo>? fieldList,
    String? sendTitleButton,
    AlertInfo? sendAlert,
  }) {
    return GivenInfo(
      headerImagePath: headerImagePath ?? this.headerImagePath,
      fieldList: fieldList ?? this.fieldList,
      sendTitleButton: sendTitleButton ?? this.sendTitleButton,
      sendAlert: sendAlert ?? this.sendAlert,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'headerImagePath': headerImagePath});
    result.addAll({'fieldList': fieldList.map((x) => x.toMap()).toList()});
    result.addAll({'sendTitleButton': sendTitleButton});
    result.addAll({'sendAlert': sendAlert.toMap()});
  
    return result;
  }

  factory GivenInfo.fromMap(Map<String, dynamic> map) {
    return GivenInfo(
      headerImagePath: map['headerImagePath'] ?? '',
      fieldList: List<FieldInfo>.from(map['fieldList']?.map((x) => FieldInfo.fromMap(x))),
      sendTitleButton: map['sendTitleButton'] ?? '',
      sendAlert: AlertInfo.fromMap(map['sendAlert']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GivenInfo.fromJson(String source) => GivenInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GivenInfo(headerImagePath: $headerImagePath, fieldList: $fieldList, sendTitleButton: $sendTitleButton, sendAlert: $sendAlert)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GivenInfo &&
      other.headerImagePath == headerImagePath &&
      listEquals(other.fieldList, fieldList) &&
      other.sendTitleButton == sendTitleButton &&
      other.sendAlert == sendAlert;
  }

  @override
  int get hashCode {
    return headerImagePath.hashCode ^
      fieldList.hashCode ^
      sendTitleButton.hashCode ^
      sendAlert.hashCode;
  }
}
