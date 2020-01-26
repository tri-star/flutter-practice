import 'package:flutter_practice/domain/validation_error.dart';

class Schedule {
  String name = '';
  DateTime date;

  String url = '';
  String memo = '';

  Schedule({this.name, this.date, this.url, this.memo});

  static Schedule fromMap(Map<String, dynamic> map) {
    return Schedule(
      name: map['name'] ?? '',
      date: map['date'] ?? null,
      url: map['url'] ?? '',
      memo: map['memo'] ?? '',
    );
  }

  ValidationError validateName(String value) {
    if (value.trim().length == 0) {
      return ValidationError(message: '名前は必須です');
    }
    return null;
  }
}
