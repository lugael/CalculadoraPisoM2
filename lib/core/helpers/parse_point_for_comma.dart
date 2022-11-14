class ParsePointForComma {
  static double toDouble(String? values) {
    if (values == null) return 0.0;
    return double.tryParse(values.replaceAll(',', '.')) ?? 0.0;
  }
}
