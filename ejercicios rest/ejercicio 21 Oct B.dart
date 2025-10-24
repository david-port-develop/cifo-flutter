import 'dart:convert';
import 'package:http/http.dart' as http;

// =============================================
// RECOMENDACIONES TÉCNICAS
// =============================================

/// 💡 Utiliza constantes globales
const String baseUrl = "https://reqres.in/api";

// =============================================
// MODELOS DE DATOS
// =============================================

/// Modelo para la entidad 'Persona' (copiado del ejercicio anterior).
class Persona {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  Persona({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      id: json['id'] as int,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      avatar: json['avatar'] as String,
    );
  }

  @override
  String toString() {
    return 'Persona(id: $id, nombre: $firstName $lastName)';
  }
}

/// Modelo para la entidad 'Recurso' (copiado del ejercicio anterior).
class Recurso {
  final int id;
  final String name;
  final int year;
  final String color;
  final String pantoneValue;

  Recurso({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneValue,
  });

  factory Recurso.fromJson(Map<String, dynamic> json) {
    return Recurso(
      id: json['id'] as int,
      name: json['name'] as String,
      year: json['year'] as int,
      color: json['color'] as String,
      pantoneValue: json['pantone_value'] as String,
    );
  }

  @override
  String toString() {
    return 'Recurso(id: $id, name: "$name", year: $year)';
  }
}

/// Tarea 1: Crear un modelo genérico ApiResponse<T>
///
/// Esta clase representa la estructura común de las respuestas de la API
/// que incluyen paginación. El tipo `T` permite que el campo `data` pueda
/// contener cualquier tipo de dato (ej. List<Persona>, List<Recurso>).
///
class ApiResponse<T> {
  /// Tarea 2: Analizar los datos de respuesta (campos de paginación)
  final int page;
  final int perPage;
  final int total;
  final int totalPages;

  /// Tarea 2: Analizar los datos de respuesta (contenido)
  final T data;

  ApiResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  /// Constructor factory para crear una instancia desde JSON.
  ///
  /// Recibe el mapa JSON y una función `dataMapper` que sabe cómo
  /// convertir el campo `data` del JSON al tipo genérico `T`.
  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) dataMapper) {
    return ApiResponse<T>(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
      totalPages: json['total_pages'] as int,
      data: dataMapper(json['data']),
    );
  }

  @override
  String toString() {
    return 'ApiResponse(page: $page/$totalPages, totalItems: $total, data: ${data.toString()})';
  }
}

// =============================================
// SERVICIO DE API
// =============================================

/// 💡 Centraliza las peticiones en una clase ReqResService
class ReqResService {
  final Map<String, String> _headers = {
    'x-api-key': 'reqres-free-v1',
  };

  /// Tarea 3: Integrar con los modelos existentes.
  ///
  /// Este método ahora devuelve un `Future<ApiResponse<List<Persona>>?>`.
  /// Esto nos da acceso tanto a la lista de personas como a la información
  /// de paginación, todo en un solo objeto fuertemente tipado.
  Future<ApiResponse<List<Persona>>?> getListPersonas() async {
    final url = Uri.parse('$baseUrl/users?page=1');

    try {
      final response = await http.get(url, headers: _headers);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        // Esta es la función que le dice al ApiResponse.fromJson cómo
        // convertir el campo 'data' (que es una lista de mapas)
        // en una List<Persona>.
        List<Persona> personaDataMapper(dynamic data) {
          final list = data as List;
          return list
              .map((item) => Persona.fromJson(item as Map<String, dynamic>))
              .toList();
        }

        return ApiResponse.fromJson(jsonResponse, personaDataMapper);
      } else {
        print(
            '-> Error al obtener la lista de usuarios: Código ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('-> Ocurrió un error de red al obtener la lista de usuarios: $e');
      return null;
    }
  }

  /// Tarea 3: Integrar con los modelos existentes.
  ///
  /// Al igual que con las personas, este método ahora devuelve un
  /// `Future<ApiResponse<List<Recurso>>?>`.
  Future<ApiResponse<List<Recurso>>?> getListRecursos() async {
    final url = Uri.parse('$baseUrl/resource');

    try {
      final response = await http.get(url, headers: _headers);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        // El mismo patrón: una función que sabe cómo mapear 'data' a List<Recurso>.
        List<Recurso> recursoDataMapper(dynamic data) {
          final list = data as List;
          return list
              .map((item) => Recurso.fromJson(item as Map<String, dynamic>))
              .toList();
        }

        return ApiResponse.fromJson(jsonResponse, recursoDataMapper);
      } else {
        print(
            '-> Error al obtener la lista de recursos: Código ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('-> Ocurrió un error de red al obtener la lista de recursos: $e');
      return null;
    }
  }

  /// Método para obtener un único recurso y probar el manejo de errores 404.
  Future<Recurso?> getSingleRecurso(int id) async {
    final url = Uri.parse('$baseUrl/resource/$id');
    try {
      final response = await http.get(url, headers: _headers);

      /// 💡 Añade manejo de errores
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        // La respuesta para un solo item no tiene paginación,
        // por lo que se extrae 'data' directamente.
        return Recurso.fromJson(jsonResponse['data'] as Map<String, dynamic>);
      } else if (response.statusCode == 404) {
        print('-> Recurso con ID $id no encontrado (Error 404).');
        return null;
      } else {
        print(
            '-> Error en la petición para el recurso $id: Código ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('-> Ocurrió un error de red al buscar el recurso $id: $e');
      return null;
    }
  }
}

// =============================================
// FUNCIÓN PRINCIPAL Y PRUEBAS
// =============================================

void main() async {
  print('--- Iniciando Ejercicio 3: Modelo de Respuesta General ---');

  final reqResService = ReqResService();

  // --- Prueba 1: Obtener lista de usuarios con el modelo genérico ---
  print('\n1. Obteniendo lista de usuarios con modelo genérico...');
  final ApiResponse<List<Persona>>? userResponse =
      await reqResService.getListPersonas();

  if (userResponse != null) {
    print('✅ Respuesta de usuarios obtenida:');
    print('   - Información de paginación:');
    print(
        '     Página ${userResponse.page} de ${userResponse.totalPages}. Total de usuarios: ${userResponse.total}.');
    print('   - Contenido (data):');
    for (final persona in userResponse.data) {
      print('     - ${persona.firstName} ${persona.lastName}');
    }
  } else {
    print('❌ No se pudo obtener la respuesta de usuarios.');
  }

  // --- Prueba 2: Obtener lista de recursos con el modelo genérico ---
  print('\n2. Obteniendo lista de recursos con modelo genérico...');
  final ApiResponse<List<Recurso>>? resourceResponse =
      await reqResService.getListRecursos();

  if (resourceResponse != null) {
    print('✅ Respuesta de recursos obtenida:');
    print('   - Información de paginación:');
    print(
        '     Página ${resourceResponse.page} de ${resourceResponse.totalPages}. Total de recursos: ${resourceResponse.total}.');
    print('   - Contenido (data):');
    for (final recurso in resourceResponse.data) {
      print('     - ${recurso.name} (Año: ${recurso.year})');
    }
  } else {
    print('❌ No se pudo obtener la respuesta de recursos.');
  }

  // --- Prueba 3: Probar manejo de errores 404 ---
  print('\n3. Intentando obtener un recurso inexistente (ID 23)...');
  final Recurso? recursoInexistente = await reqResService.getSingleRecurso(23);
  if (recursoInexistente == null) {
    print('✅ El manejo de error 404 funcionó como se esperaba.');
  }

  print('\n--- Ejercicio completado ---');
}
