import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> debugLanguages() async {
  try {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/name/spain'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final country = data[0]; // Primer país del resultado

      print('=== ESTRUCTURA DE LANGUAGES ===');
      print(JsonEncoder.withIndent('  ').convert(country['languages']));

      print('\n=== IDIOMAS DEL PAÍS ===');
      final languages = country['languages'] as Map<String, dynamic>;

      // 1. Imprimir todos los idiomas
      print('\nTodos los idiomas:');
      languages.forEach((code, nativeName) {
        print('$code: $nativeName');
      });

      // 2. Obtener el primer idioma
      print('\nPrimer idioma:');
      if (languages.isNotEmpty) {
        final firstLang = languages.entries.first;
        print('Código: ${firstLang.key}');
        print('Nombre: ${firstLang.value}');
      }

      // 3. Obtener un idioma específico (por ejemplo, español)
      print('\nIdioma específico (español):');
      print('Español: ${languages['spa']}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

void main() async {
  await debugLanguages();
}
