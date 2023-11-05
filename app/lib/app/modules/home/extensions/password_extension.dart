extension ValidatorExtension on String? {
  bool isValidEmail() => RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(this ?? '');
  
  bool isValidPassword() => hasMinChars() && hasOneNumber() && hasOneLowerLetter() && hasOneUpperLetter() && hasOneSymbol();
  bool hasMinChars() => this != null ? this!.length >= 8 : false;
  bool hasOneNumber() => RegExp(r'[0-9]').hasMatch(this ?? '');
  bool hasOneLowerLetter() => RegExp(r'[a-z]').hasMatch(this ?? '');
  bool hasOneUpperLetter() => RegExp(r'[A-Z]').hasMatch(this ?? '');
  bool hasOneSymbol() => RegExp(r'[!@#\$%&*]').hasMatch(this ?? '');  
}
