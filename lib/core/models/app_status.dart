import 'dart:convert';

class AppStatus {
  final int capitalOfGraceTarget;
  final int numberOfBlocks;
  final int numberOfCapitalOfGrace;
  final int numberOfCompletedBlocks;
  final int numberOfSendedCapitalOfGrace;
  AppStatus({
    required this.capitalOfGraceTarget,
    required this.numberOfBlocks,
    required this.numberOfCapitalOfGrace,
    required this.numberOfCompletedBlocks,
    required this.numberOfSendedCapitalOfGrace,
  });

  AppStatus copyWith({
    int? capitalOfGraceTarget,
    int? numberOfBlocks,
    int? numberOfCapitalOfGrace,
    int? numberOfCompletedBlocks,
    int? numberOfSendedCapitalOfGrace,
  }) {
    return AppStatus(
      capitalOfGraceTarget: capitalOfGraceTarget ?? this.capitalOfGraceTarget,
      numberOfBlocks: numberOfBlocks ?? this.numberOfBlocks,
      numberOfCapitalOfGrace: numberOfCapitalOfGrace ?? this.numberOfCapitalOfGrace,
      numberOfCompletedBlocks: numberOfCompletedBlocks ?? this.numberOfCompletedBlocks,
      numberOfSendedCapitalOfGrace: numberOfSendedCapitalOfGrace ?? this.numberOfSendedCapitalOfGrace,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'capitalOfGraceTarget': capitalOfGraceTarget});
    result.addAll({'numberOfBlocks': numberOfBlocks});
    result.addAll({'numberOfCapitalOfGrace': numberOfCapitalOfGrace});
    result.addAll({'numberOfCompletedBlocks': numberOfCompletedBlocks});
    result.addAll({'numberOfSendedCapitalOfGrace': numberOfSendedCapitalOfGrace});
  
    return result;
  }

  factory AppStatus.fromMap(Map<String, dynamic> map) {
    return AppStatus(
      capitalOfGraceTarget: map['capitalOfGraceTarget']?.toInt() ?? 0,
      numberOfBlocks: map['numberOfBlocks']?.toInt() ?? 0,
      numberOfCapitalOfGrace: map['numberOfCapitalOfGrace']?.toInt() ?? 0,
      numberOfCompletedBlocks: map['numberOfCompletedBlocks']?.toInt() ?? 0,
      numberOfSendedCapitalOfGrace: map['numberOfSendedCapitalOfGrace']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppStatus.fromJson(String source) => AppStatus.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppStatus(capitalOfGraceTarget: $capitalOfGraceTarget, numberOfBlocks: $numberOfBlocks, numberOfCapitalOfGrace: $numberOfCapitalOfGrace, numberOfCompletedBlocks: $numberOfCompletedBlocks, numberOfSendedCapitalOfGrace: $numberOfSendedCapitalOfGrace)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AppStatus &&
      other.capitalOfGraceTarget == capitalOfGraceTarget &&
      other.numberOfBlocks == numberOfBlocks &&
      other.numberOfCapitalOfGrace == numberOfCapitalOfGrace &&
      other.numberOfCompletedBlocks == numberOfCompletedBlocks &&
      other.numberOfSendedCapitalOfGrace == numberOfSendedCapitalOfGrace;
  }

  @override
  int get hashCode {
    return capitalOfGraceTarget.hashCode ^
      numberOfBlocks.hashCode ^
      numberOfCapitalOfGrace.hashCode ^
      numberOfCompletedBlocks.hashCode ^
      numberOfSendedCapitalOfGrace.hashCode;
  }
}
