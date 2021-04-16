import 'dart:convert';

String getEnumName(String enumString) {
  return enumString.split('.').last;
}

/// converts Map data to string
String prettyPrint(Map json) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}
