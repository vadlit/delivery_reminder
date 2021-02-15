extension StringExtensions on String {
  String capitalize() {
    if (this == null) {
      return null;
    }
    if (isEmpty) {
      return this;
    }
    if (length == 1) {
      return toUpperCase();
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
