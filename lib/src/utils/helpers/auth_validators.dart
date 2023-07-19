String? passwordValidator(String? value) {
  if (!_passwordIsStrong(value!)) return 'Please insert a strong password';
  return null;
}

bool _passwordIsStrong(String password) =>
    _passwordStates(password).every((element) => element);

bool _matchRegex({required String pattern, required String password}) =>
    RegExp(pattern).hasMatch(password);

List<bool> _passwordStates(String password) {
  return [
    _matchRegex(pattern: r'[A-Z]', password: password), // has upper case
    _matchRegex(pattern: r'[a-z]', password: password), // has lower case
    _matchRegex(pattern: r'[!@#\$&*~,.;:]', password: password), // has symbol
    _matchRegex(pattern: r'[0-9]', password: password), // has number
    _matchRegex(
        pattern: r'.{8,}', password: password,), // is at least 8 chars long
  ];
}

String? emailValidator(String? value) {
  if (!isEmail(value!)) return "Please insert a valid email address";
  
  return null;
}

bool isEmail(String s) {
  var matchRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',);
      
  return matchRegex.hasMatch(s);
}

bool isValidPhoneNumber(String number) {
  // Regular expression to match a US phone number pattern
  RegExp regExp = RegExp(r'^\+1\d{10}$|^1\d{10}$|^\d{10}$');

  // Check if the number matches the pattern
  return regExp.hasMatch(number);
}