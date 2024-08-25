import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/ranking/models/ranking_item_info.dart';

class RankingInfo {
  final String toolbarTitle;
  final List<RankingItemInfo> itemList;
  final String textColor;
  final bool hasDivider;
  RankingInfo({
    required this.toolbarTitle,
    required this.itemList,
    required this.textColor,
    required this.hasDivider,
  });

  RankingInfo copyWith({
    String? toolbarTitle,
    List<RankingItemInfo>? itemList,
    String? textColor,
    bool? hasDivider,
  }) {
    return RankingInfo(
      toolbarTitle: toolbarTitle ?? this.toolbarTitle,
      itemList: itemList ?? this.itemList,
      textColor: textColor ?? this.textColor,
      hasDivider: hasDivider ?? this.hasDivider,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'toolbarTitle': toolbarTitle});
    result.addAll({'itemList': itemList.map((x) => x.toMap()).toList()});
    result.addAll({'textColor': textColor});
    result.addAll({'hasDivider': hasDivider});
  
    return result;
  }

  factory RankingInfo.fromMap(Map<String, dynamic> map) {
    return RankingInfo(
      toolbarTitle: map['toolbarTitle'] ?? '',
      itemList: List<RankingItemInfo>.from(map['itemList']?.map((x) => RankingItemInfo.fromMap(x))),
      textColor: map['textColor'] ?? '',
      hasDivider: map['hasDivider'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory RankingInfo.fromJson(String source) => RankingInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RankingInfo(toolbarTitle: $toolbarTitle, itemList: $itemList, textColor: $textColor, hasDivider: $hasDivider)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RankingInfo &&
      other.toolbarTitle == toolbarTitle &&
      listEquals(other.itemList, itemList) &&
      other.textColor == textColor &&
      other.hasDivider == hasDivider;
  }

  @override
  int get hashCode {
    return toolbarTitle.hashCode ^
      itemList.hashCode ^
      textColor.hashCode ^
      hasDivider.hashCode;
  }
}
