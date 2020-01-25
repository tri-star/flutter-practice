import 'package:flutter_practice/domain/validation_error.dart';

class Schedule {
  String name = '';
  DateTime date;

  String url = '';
  String memo = '';

  ValidationError validateName(String value) {
    if (value.trim().length == 0) {
      return ValidationError(message: '名前は必須です');
    }
    return null;
  }
}
