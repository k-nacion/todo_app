class TodoServiceException implements Exception{
  final String? message;

  TodoServiceException([this.message]);

  @override
  String toString() {
    return 'TodoServiceException{message: $message}';
  }
}