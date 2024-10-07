class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, 'No Internet ');
}

class RequestTimOut extends AppException {
  RequestTimOut([String? message]) : super(message, 'Request Timeout ');
}

class ServerException extends AppException {
  ServerException([String? message])
      : super(message, 'Response from server failed ');
}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message, 'Inavalid URL ');
}

class FetchDataException extends AppException {
  FetchDataException([String? super.message]);
}
