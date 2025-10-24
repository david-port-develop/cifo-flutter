import 'dart:convert';
import 'package:http/http.dart' as http;

// =============================================================================
// EJERCICIO 1: Comprender la estructura del JSON anidado
// =============================================================================

/// Tarea 1: Realiza una petición simple y analiza la estructura del JSON.
Future<void> estructuraJSON() async {
  // 1. Petición a la v2 de la API, como se indica en el enunciado.
  final url = Uri.parse('https://restcountries.com/v2/name/peru');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // La API devuelve una lista, tomamos el primer país.
      final List<dynamic> data = jsonDecode(response.body);
      final Map<String, dynamic> countryData = data.first;

      // 2. Imprimir la estructura completa de forma legible.
      print('\n--- Estructura JSON del País (v2) ---');
      print(JsonEncoder.withIndent('  ').convert(countryData));

      // 3 y 4. Anotar los tipos de datos de los campos principales.
      print('\n--- Anotación de Tipos de Datos (v2) ---');
      print('''
      - country (List<dynamic> -> Map<String, dynamic>): El objeto principal del país.
        - name (String): Nombre común del país.
        - capital (String): La capital.
        - region (String): La región a la que pertenece.
        - currencies (List<Map<String, dynamic>>): Lista de monedas.
          - code (String): Código de la moneda (ej. 'PEN').
          - name (String): Nombre de la moneda.
          - symbol (String): Símbolo de la moneda.
        - languages (List<Map<String, dynamic>>): Lista de idiomas.
          - iso639_1 (String): Código del idioma.
          - name (String): Nombre del idioma.
        - flags (Map<String, String>): Mapa con URLs de las banderas.
          - svg (String): URL a la imagen SVG.
          - png (String): URL a la imagen PNG.
      ''');
    } else {
      print('Error en la petición del Ejercicio 1: ${response.statusCode}');
    }
  } catch (e) {
    print('Ocurrió un error de red en el Ejercicio 1: $e');
  }
}

// =============================================================================
// EJERCICIO 2: Modelo anidado básico (Country + Name)
// =============================================================================

/// 1. Definición de la clase `Name`.
/// Nota: Esta estructura corresponde a la API v3.1.
class Name {
  final String common;
  final String official;

  Name({required this.common, required this.official});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      common: json['common'] ?? '',
      official: json['official'] ?? '',
    );
  }
}

/// 1. Definición de la clase `Country`.
/// Nota: Esta estructura corresponde a la API v3.1.
class Country {
  final Name name;
  final String region;
  final String capital;

  Country({
    required this.name,
    required this.region,
    required this.capital,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      // El campo 'name' es un objeto JSON, por lo que usamos Name.fromJson.
      name: Name.fromJson(json['name']),
      region: json['region'] ?? '',
      // El campo 'capital' en la v3.1 es una lista, tomamos el primer elemento.
      capital: (json['capital'] is List && json['capital'].isNotEmpty)
          ? json['capital'][0]
          : (json['capital'] ?? 'N/A'),
    );
  }
}

/// 2. Función `fetchCountry` que obtiene y parsea los datos.
Future<Country?> fetchCountry(String countryName) async {
  // Usamos la API v3.1 para que coincida con la estructura de las clases.
  final url = Uri.parse('https://restcountries.com/v3.1/name/$countryName');

  // Bonus: Añadimos try/catch para el manejo de errores.
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      // Parseamos el primer país de la lista a nuestro objeto Country.
      final country = Country.fromJson(data.first);

      // Mostramos los datos solicitados.
      print('✅ País encontrado: ${country.name.common}');
      print('   Capital: ${country.capital}');
      return country;
    } else if (response.statusCode == 404) {
      print('❌ País no encontrado: $countryName');
      return null;
    } else {
      print('❌ Error del servidor: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('❌ Ocurrió un error de red o de formato: $e');
    return null;
  }
}

void main() async {
  print('--- Ejecutando Ejercicio 1 ---');
  await estructuraJSON();

  print('\n\n--- Ejecutando Ejercicio 2 ---');
  await fetchCountry('france');
  await fetchCountry('otropais'); // Prueba de error 404
}
