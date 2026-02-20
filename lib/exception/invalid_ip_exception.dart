
/// Исключение для недопустимого символа в строке IP.
/// Сообщение: "Недопустимый символ 'x'"
class InvalidIpException implements Exception {
  final String message;
  final String invalidChar;
  
  InvalidIpException(this.message, this.invalidChar);
  
  @override
  String toString() => message;
}
