import 'dart:convert';

class BoxInfo {
  final int target;
  final String imagePath;
  BoxInfo({
    required this.target,
    required this.imagePath,
  });

  BoxInfo copyWith({
    int? target,
    String? imagePath,
  }) {
    return BoxInfo(
      target: target ?? this.target,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'target': target});
    result.addAll({'imagePath': imagePath});

    return result;
  }

  factory BoxInfo.fromMap(Map<String, dynamic> map) {
    return BoxInfo(
      target: map['target']?.toInt() ?? 0,
      imagePath: map['imagePath'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BoxInfo.fromJson(String source) =>
      BoxInfo.fromMap(json.decode(source));

  @override
  String toString() => 'BoxInfo(target: $target, imagePath: $imagePath)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoxInfo &&
        other.target == target &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode => target.hashCode ^ imagePath.hashCode;
}
