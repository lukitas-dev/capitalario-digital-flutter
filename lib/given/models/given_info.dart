import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/core/models/alert_info.dart';
import 'package:app/core/models/button_style_info.dart';
import 'package:app/core/models/field_info.dart';
import 'package:app/core/models/field_style_info.dart';
import 'package:app/core/models/quantity_field_info.dart';

class GivenInfo {
  final String toolbarTitle;
  final String headerImagePath;
  final FieldInfo regionField;
  final FieldInfo offerField;
  final FieldStyleInfo fieldStyleInfo;
  final QuantityFieldInfo quantityField;
  final String sendTitleButton;
  final ButtonStyleInfo sendButtonStyle;
  final AlertInfo sendAlert;
  GivenInfo({
    required this.toolbarTitle,
    required this.headerImagePath,
    required this.regionField,
    required this.offerField,
    required this.fieldStyleInfo,
    required this.quantityField,
    required this.sendTitleButton,
    required this.sendButtonStyle,
    required this.sendAlert,
  });

  GivenInfo copyWith({
    String? toolbarTitle,
    String? headerImagePath,
    FieldInfo? regionField,
    FieldInfo? offerField,
    FieldStyleInfo? fieldStyleInfo,
    QuantityFieldInfo? quantityField,
    String? sendTitleButton,
    ButtonStyleInfo? sendButtonStyle,
    AlertInfo? sendAlert,
  }) {
    return GivenInfo(
      toolbarTitle: toolbarTitle ?? this.toolbarTitle,
      headerImagePath: headerImagePath ?? this.headerImagePath,
      regionField: regionField ?? this.regionField,
      offerField: offerField ?? this.offerField,
      fieldStyleInfo: fieldStyleInfo ?? this.fieldStyleInfo,
      quantityField: quantityField ?? this.quantityField,
      sendTitleButton: sendTitleButton ?? this.sendTitleButton,
      sendButtonStyle: sendButtonStyle ?? this.sendButtonStyle,
      sendAlert: sendAlert ?? this.sendAlert,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'toolbarTitle': toolbarTitle});
    result.addAll({'headerImagePath': headerImagePath});
    result.addAll({'regionField': regionField.toMap()});
    result.addAll({'offerField': offerField.toMap()});
    result.addAll({'fieldStyleInfo': fieldStyleInfo.toMap()});
    result.addAll({'quantityField': quantityField.toMap()});
    result.addAll({'sendTitleButton': sendTitleButton});
    result.addAll({'sendButtonStyle': sendButtonStyle.toMap()});
    result.addAll({'sendAlert': sendAlert.toMap()});
  
    return result;
  }

  factory GivenInfo.fromMap(Map<String, dynamic> map) {
    return GivenInfo(
      toolbarTitle: map['toolbarTitle'] ?? '',
      headerImagePath: map['headerImagePath'] ?? '',
      regionField: FieldInfo.fromMap(map['regionField']),
      offerField: FieldInfo.fromMap(map['offerField']),
      fieldStyleInfo: FieldStyleInfo.fromMap(map['fieldStyleInfo']),
      quantityField: QuantityFieldInfo.fromMap(map['quantityField']),
      sendTitleButton: map['sendTitleButton'] ?? '',
      sendButtonStyle: ButtonStyleInfo.fromMap(map['sendButtonStyle']),
      sendAlert: AlertInfo.fromMap(map['sendAlert']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GivenInfo.fromJson(String source) =>
      GivenInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GivenInfo(toolbarTitle: $toolbarTitle, headerImagePath: $headerImagePath, regionField: $regionField, offerField: $offerField, fieldStyleInfo: $fieldStyleInfo, quantityField: $quantityField, sendTitleButton: $sendTitleButton, sendButtonStyle: $sendButtonStyle, sendAlert: $sendAlert)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GivenInfo &&
      other.toolbarTitle == toolbarTitle &&
      other.headerImagePath == headerImagePath &&
      other.regionField == regionField &&
      other.offerField == offerField &&
      other.fieldStyleInfo == fieldStyleInfo &&
      other.quantityField == quantityField &&
      other.sendTitleButton == sendTitleButton &&
      other.sendButtonStyle == sendButtonStyle &&
      other.sendAlert == sendAlert;
  }

  @override
  int get hashCode {
    return toolbarTitle.hashCode ^
      headerImagePath.hashCode ^
      regionField.hashCode ^
      offerField.hashCode ^
      fieldStyleInfo.hashCode ^
      quantityField.hashCode ^
      sendTitleButton.hashCode ^
      sendButtonStyle.hashCode ^
      sendAlert.hashCode;
  }
}
