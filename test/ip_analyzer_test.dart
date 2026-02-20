
import 'package:test/test.dart';
import 'package:ip_analyzer/ip_analyzer.dart';

void main() {
  final analyzer = IpAnalyzer();
  
  group('Analyseur IP Test', () {
    test('Cas nominal avec plusieurs adresses IP', () {
      const input = "192.168.1.1 10.0.0.1";
      final result = analyzer.analyzeIpString(input);

      expect(result["1"], equals(6));
      expect(result["9"], equals(1));
      expect(result["2"], equals(1));
      expect(result["."], equals(6));
      expect(result["6"], equals(1));
      expect(result["8"], equals(1));
      expect(result["0"], equals(3));
      // Vérifier que les espaces ne sont pas dans la map
      expect(result.containsKey(" "), isFalse);
    });
    
    test('Throw an exception for an empty string', () {
      const input = "";
      expect(
        () => analyzer.analyzeIpString(input),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains("Строка не может быть пустой"),
        )),
      );
    });
    
    test('Throw an exception for an invalid character', () {
      const input = "192.a.1.1";
      expect(
        () => analyzer.analyzeIpString(input),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains("Недопустимый символ 'a'"),
        )),
      );
    });

    test('Adresse IP unique', () {
      const input = "127.0.0.1";
      final result = analyzer.analyzeIpString(input);
      
      expect(result["1"], equals(2));
      expect(result["0"], equals(2));
      expect(result["7"], equals(1));
      expect(result["."], equals(3));
    });

    test('should handle string with only spaces as valid but empty result', () {
      // Note: Requirement specifies empty string "" throws. 
      // "   " is not empty, but contains no valid chars.
      const input = "   ";
      final result = analyzer.analyzeIpString(input);
      expect(result, isEmpty);
    });
  });
}
