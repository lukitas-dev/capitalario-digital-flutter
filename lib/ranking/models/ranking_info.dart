import 'dart:convert';

import 'package:flutter/foundation.dart';

class RankingInfo {
  final String toolbarTitle;
  final List<String> idItemList;
  final List<String> labelItemList;
  final String textColor;
  final bool hasDivider;
  RankingInfo({
    required this.toolbarTitle,
    required this.idItemList,
    required this.labelItemList,
    required this.textColor,
    required this.hasDivider,
  });

  RankingInfo copyWith({
    String? toolbarTitle,
    List<String>? idItemList,
    List<String>? labelItemList,
    String? textColor,
    bool? hasDivider,
  }) {
    return RankingInfo(
      toolbarTitle: toolbarTitle ?? this.toolbarTitle,
      idItemList: idItemList ?? this.idItemList,
      labelItemList: labelItemList ?? this.labelItemList,
      textColor: textColor ?? this.textColor,
      hasDivider: hasDivider ?? this.hasDivider,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'toolbarTitle': toolbarTitle});
    result.addAll({'idItemList': idItemList});
    result.addAll({'labelItemList': labelItemList});
    result.addAll({'textColor': textColor});
    result.addAll({'hasDivider': hasDivider});
  
    return result;
  }

  factory RankingInfo.fromMap(Map<String, dynamic> map) {
    return RankingInfo(
      toolbarTitle: map['toolbarTitle'] ?? '',
      idItemList: List<String>.from(map['idItemList']),
      labelItemList: List<String>.from(map['labelItemList']),
      textColor: map['textColor'] ?? '',
      hasDivider: map['hasDivider'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory RankingInfo.fromJson(String source) => RankingInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RankingInfo(toolbarTitle: $toolbarTitle, idItemList: $idItemList, labelItemList: $labelItemList, textColor: $textColor, hasDivider: $hasDivider)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RankingInfo &&
      other.toolbarTitle == toolbarTitle &&
      listEquals(other.idItemList, idItemList) &&
      listEquals(other.labelItemList, labelItemList) &&
      other.textColor == textColor &&
      other.hasDivider == hasDivider;
  }

  @override
  int get hashCode {
    return toolbarTitle.hashCode ^
      idItemList.hashCode ^
      labelItemList.hashCode ^
      textColor.hashCode ^
      hasDivider.hashCode;
  }
}
