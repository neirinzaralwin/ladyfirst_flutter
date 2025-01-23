// ignore_for_file: unnecessary_this

extension TextExtensions on String {
  String get startCapitalize {
    if (this.isEmpty) return this;
    return this[0].toUpperCase() + this.substring(1);
  }

  String get capitalized {
    if (this.isEmpty) return this;
    return this.split(" ").map((e) => e.startCapitalize).join(" ");
  }
}
