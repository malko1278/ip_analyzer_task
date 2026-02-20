
/// Исключение выдано для пустой строки IP
class EmptyIpException implements Exception {
  final String message;
  
  EmptyIpException(this.message);
  
  @override
  String toString() => message;
}
