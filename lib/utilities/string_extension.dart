extension StringExtension on String {
  String get capitalizeFirst => '${this[0].toUpperCase()}${substring(1)}';
  String get titleCase => split(" ").map((str) => str.capitalizeFirst).join(" ");
}