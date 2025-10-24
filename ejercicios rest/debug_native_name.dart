import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> debugNativeName() async {
  try {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/name/spain'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final country = data[0]; // Primer país del resultado

      print('=== ESTRUCTURA DE NAME Y NATIVENAME ===');
      print(JsonEncoder.withIndent('  ').convert(country['name']));

      print('\n=== ACCEDIENDO A NATIVENAME ===');
      if (country['name']['nativeName'] != null) {
        country['name']['nativeName'].forEach((langCode, nameData) {
          print('Idioma: $langCode');
          print('  Nombre oficial: ${nameData['official']}');
          print('  Nombre común: ${nameData['common']}');
        });
      }
    }
  } catch (e) {
    print('Error: $e');
  }
}

void main() async {
  await debugNativeName();
}
