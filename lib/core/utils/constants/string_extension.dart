extension StringExtension on String {
  String toCapitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
