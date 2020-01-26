import 'validation_error.dart';

class ValidationErrors {
  final Map<String, ValidationError> _errors;

  ValidationErrors() : _errors = {};

  ValidationError add(String key, ValidationError error) {
    return _errors[key] = error;
  }

  ValidationError get(String key) {
    return _errors[key];
  }

  bool has(String key) {
    return _errors.containsKey(key);
  }

  List<String> getAllMessages() {
    return _errors.values.map((e) => e.message).toList();
  }
}
