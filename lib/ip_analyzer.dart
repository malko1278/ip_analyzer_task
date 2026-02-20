
class IpAnalyzer {
  Map<String, int> analyzeIpString(String input) {
    // Обработать ошибку пустой строки
    if (input.isEmpty)  throw Exception("Строка не может быть пустой");

    // Map (словарь) для хранения результатов
    final Map<String, int> charCounts = {};

    // Цикл для обработки строки
    // Итерации на основе индекса для явных требований к производительности и циклу
    for (int i = 0; i < input.length; i++) {
      final String char = input[i];

      // Исходя из примера ввода "192.168.1.1 10.0.0.1", пробелы присутствуют
      if (char.trim().isEmpty)  continue;

      // Допустимыми символами являются цифры (0-9) и точка (.)
      if (char == '.' || _isDigit(char)) {
        // Количество приращений на Map
        charCounts[char] = (charCounts[char] ?? 0) + 1;
      } else {
        // Обрабатывать ошибки с помощью исключений
        throw Exception("Недопустимый символ '$char'");
      }
    }

    return charCounts;
  }

  /// Проверяет, является ли символ числовой цифрой (0-9).
  bool _isDigit(String char) {
    // Сравнение, основанное на значениях ASCII/Unicode, является эффективным и стандартным
    return char.codeUnitAt(0) >= 48 && char.codeUnitAt(0) <= 57;
  }
}
