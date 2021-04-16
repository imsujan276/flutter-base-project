import 'package:flutter/material.dart';

/// password validator
String validatePassword({@required String string}) {
  if (string.isEmpty) {
    return "* Required";
  } else if (string.length < 6) {
    return "Password should be atleast 6 characters";
  } else if (string.length > 15) {
    return "Password should not be greater than 15 characters";
  } else
    return null;
}

String confirmPassword(
    {@required String password, @required String cPassword}) {
  if (password == cPassword) {
    return null;
  } else
    return "Passwords do not match.";
}

/// email validator
String validateEmail({@required String string}) {
  String regex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  if (string.isEmpty) return "* Required";
  if (!validRegexExp(regex, string)) {
    return "Invalid Email";
  } else
    return null;
}

/// validate min length
String validateMinLength({@required String string, @required int length}) {
  return (string.length < length && string.isEmpty)
      ? "It must be greate than $length characters"
      : null;
}

/// validate max length
String validateMaxLength({@required String string, int length = 4}) {
  return string.length > length
      ? "It must not exceed $length characters"
      : null;
}

/// validate empty string
String validateIsEmpty({@required String string}) {
  return string.isEmpty ? "* Required" : null;
}

/// validate min-max length
String validateMinMaxLength(
    {@required String string, int minLegth = 1, int maxLength = 10}) {
  return (string.length < minLegth || string.length > maxLength)
      ? "It must be between $minLegth and $maxLength characters"
      : null;
}

/// validate min-max length with regex
String validateMinMaxLengthWithRegex(
    {@required String string,
    int minLegth = 1,
    int maxLength = 10,
    @required String regex,
    String regexMessage = "Invalid data"}) {
  if (string.length < minLegth || string.length > maxLength) {
    return "It must be between $minLegth and $maxLength characters";
  } else if (!validRegexExp(regex, string)) {
    return regexMessage;
  } else
    return null;
}

/// validate regex for the string
bool validRegexExp(String regex, String string) {
  return RegExp(regex).hasMatch(string);
}
