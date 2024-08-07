

bool emailValidator(String? value) {
  // Regular expression for validating an email address
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    caseSensitive: false,
    multiLine: false,
  );

  if (value == null || value.isEmpty) {
    return false;
  } else if (!emailRegExp.hasMatch(value)) {
    return false;
  }
  return true;
}
