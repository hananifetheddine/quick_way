class RegExpConfirmation {
  static RegExp nineDigitRegExp = RegExp(r'^\d{9}$');
  static RegExp alphabeticFullRegExp =
      RegExp(r'^[a-zA-ZàäïÀÄÏâÂ]{3,}( [a-zA-ZàäïÀÄÏâÂ]{3,})+$');
  static RegExp alphabeticRegExp =
      RegExp(r'^[a-zA-ZàäïÀÄÏâÂ]{3,}( [a-zA-ZàäïÀÄÏâÂ]{3,})*$');

  confirmString(String value) {}

  static bool confirmPhoneNumber(String value) =>
      nineDigitRegExp.hasMatch(value);
}
