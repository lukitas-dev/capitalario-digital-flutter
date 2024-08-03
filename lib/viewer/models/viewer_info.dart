import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/viewer/models/box_info.dart';
import 'package:app/viewer/models/grid_info.dart';

class ViewerInfo {
  final GridInfo gridInfo;
  final List<BoxInfo> boxList;
  final String boxesBackgroundcolor;
  final List<int> orderBoxCompletion;
  ViewerInfo({
    required this.gridInfo,
    required this.boxList,
    required this.boxesBackgroundcolor,
    required this.orderBoxCompletion,
  });

  ViewerInfo copyWith({
    GridInfo? gridInfo,
    List<BoxInfo>? boxList,
    String? boxesBackgroundcolor,
    List<int>? orderBoxCompletion,
  }) {
    return ViewerInfo(
      gridInfo: gridInfo ?? this.gridInfo,
      boxList: boxList ?? this.boxList,
      boxesBackgroundcolor: boxesBackgroundcolor ?? this.boxesBackgroundcolor,
      orderBoxCompletion: orderBoxCompletion ?? this.orderBoxCompletion,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'gridInfo': gridInfo.toMap()});
    result.addAll({'boxList': boxList.map((x) => x.toMap()).toList()});
    result.addAll({'boxesBackgroundcolor': boxesBackgroundcolor});
    result.addAll({'orderBoxCompletion': orderBoxCompletion});
  
    return result;
  }

  factory ViewerInfo.fromMap(Map<String, dynamic> map) {
    return ViewerInfo(
      gridInfo: GridInfo.fromMap(map['gridInfo']),
      boxList: List<BoxInfo>.from(map['boxList']?.map((x) => BoxInfo.fromMap(x))),
      boxesBackgroundcolor: map['boxesBackgroundcolor'] ?? '',
      orderBoxCompletion: List<int>.from(map['orderBoxCompletion']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ViewerInfo.fromJson(String source) =>
      ViewerInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ViewerInfo(gridInfo: $gridInfo, boxList: $boxList, boxesBackgroundcolor: $boxesBackgroundcolor, orderBoxCompletion: $orderBoxCompletion)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ViewerInfo &&
      other.gridInfo == gridInfo &&
      listEquals(other.boxList, boxList) &&
      other.boxesBackgroundcolor == boxesBackgroundcolor &&
      listEquals(other.orderBoxCompletion, orderBoxCompletion);
  }

  @override
  int get hashCode {
    return gridInfo.hashCode ^
      boxList.hashCode ^
      boxesBackgroundcolor.hashCode ^
      orderBoxCompletion.hashCode;
  }
}
