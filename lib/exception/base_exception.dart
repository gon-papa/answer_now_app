class BaseException implements Exception {
  final String message;
  final String? code;

  BaseException({required this.message, this.code});

  @override
  String toString() {
    return message;
  }
}
