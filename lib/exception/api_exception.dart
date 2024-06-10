import 'package:answer_now_app/importer.dart';

class ApiException implements Exception {
  final String? message;
  final Result? result;
  ApiException(this.message, {this.result});

  @override
  String toString() {
    if (message == null) return "ApiException";
    return "$message";
  }

  get logString => "ApiException: $message";
  get getResult => result;

  String toLogString() => "ApiException: $message";
}
