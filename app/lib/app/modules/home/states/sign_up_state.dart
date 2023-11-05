class SignUpState {
  bool isValidEmail = false;

  bool hasMinChars = false;
  bool hasOneNumber = false;
  bool hasOneLowerLetter = false;
  bool hasOneUpperLetter = false;
  bool hasOneSymbol = false;
  bool passwordMatchConfirmPassword = false;

  bool get isValidPassword => hasMinChars && hasOneNumber && hasOneLowerLetter && hasOneUpperLetter && hasOneSymbol;
}