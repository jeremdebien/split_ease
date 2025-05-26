enum SplitType { equal, unequal, percentage }

extension SplitTypeExtension on SplitType {
  String get value => toString().split('.').last;

  static SplitType fromString(String str) {
    return SplitType.values.firstWhere(
      (e) => e.value == str,
      orElse: () => SplitType.equal,
    );
  }
}
