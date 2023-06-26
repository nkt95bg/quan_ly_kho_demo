extension NumExtension on num? {
  String toStringWithFloat(int number) {
    return this?.toStringAsFixed(number).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},") ?? '';
  }
}
