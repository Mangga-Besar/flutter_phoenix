extension StringExtensions on String {
  String trimLower() => this.trim().toLowerCase();
  String inCaps() => '${this[0].toUpperCase()}${this.substring(1)}';
  String allInCaps() => this.toUpperCase();

  String httpsLower() {
    var regex = RegExp(r"^(https?)(.+)", caseSensitive: false);
    var matches = regex.allMatches(this);
    var data = matches.first;
    if ((data.groupCount) >= 2) {
      var text = data.group(1)!.toLowerCase() + data.group(2)!;
      return text;
    }
    return this;
  }
}
