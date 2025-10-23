import 'dart:convert';
import 'package:http/http.dart' as http;

// 🎯 Globalizar variables y constantes
const String baseUrl = "https://reqres.in/api";

void main() async {
  final reqResService = ReqResService();

  print("--- EJERCICIO 1: Listar y obtener usuarios ---");
  await reqResService.testUsersEndpoints();

  print("\n--- EJERCICIO 2: Trabajar con recursos ---");
  await reqResService.testResourceEndpoint();

  print("\n--- EJERCICIO 3: Modelo de respuesta general ---");
  await reqResService.testGenericApiResponse();
}

// Modelo para la entidad 'data' de usuarios
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

  // Constructor de mapeo desde JSON
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
    return 'Persona(id: $id, nombre: $firstName $lastName, email: $email)';
  }
}

// Modelo para la entidad 'data' de recursos (Ejercicio 2)
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

  // Constructor de mapeo desde JSON
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
    return 'Recurso(id: $id, name: $name, year: $year, color: $color, pantone: $pantoneValue)';
  }
}

// -----------------------------------------------------
// MARK: - Ejercicio 3: Modelo de Respuesta General
// -----------------------------------------------------

// Modelo genérico para la estructura de paginación de ReqRes
class ApiResponse<T> {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final T
      data; // Puede ser List<Persona>, Persona, List<Recurso>, Recurso, etc.

  ApiResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  // Factory constructor genérico para parsear la respuesta
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) dataMapper, // Función para mapear el campo 'data'
  ) {
    return ApiResponse<T>(
      page: json['page'] as int? ?? 0,
      perPage: json['per_page'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
      totalPages: json['total_pages'] as int? ?? 0,
      // Aplicamos el mapeador específico al campo 'data'
      data: dataMapper(json['data']),
    );
  }
}

// -----------------------------------------------------
// MARK: - Centralización de Peticiones (ReqResService)
// -----------------------------------------------------

// Centraliza las peticiones en una clase para mejor organización
class ReqResService {
  // -----------------------------------------------------
  // MARK: - Ejercicio 1: Listar y Obtener Usuarios
  // -----------------------------------------------------

  // Tarea 1: Obtener un único usuario (Single User)
  Future<Persona?> getSingleUserObject(int id) async {
    final url = Uri.parse('$baseUrl/users/$id');

    // 🎯 Manejo de errores con try / catch
    try {
      final res = await http.get(url);

      // 🎯 Verificación de códigos de estado
      if (res.statusCode == 200) {
        // Tarea 4: Decodificar el JSON y mapearlo a la clase Persona.
        final jsonResponse = json.decode(res.body);
        // El API de Single User devuelve { "data": {...} }
        return Persona.fromJson(jsonResponse['data']);
      } else if (res.statusCode == 404) {
        print(
            '✅ [getSingleUserObject] Usuario con ID $id no encontrado (404 Not Found).');
        return null;
      } else {
        print(
            '❌ [getSingleUserObject] Error en la petición: Código de estado ${res.statusCode}');
        return null;
      }
    } catch (e) {
      print(
          '❌ [getSingleUserObject] Ocurrió un error al realizar la petición: $e');
      return null;
    }
  }

  // Tarea 1: Obtener la lista de usuarios (List Users)
  Future<List<Persona>> getListPersonasObject() async {
    final url = Uri.parse('$baseUrl/users?page=1');

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        final jsonResponse = json.decode(res.body);
        final data = jsonResponse['data'] as List;

        // Mapeamos cada elemento de la lista 'data' a un objeto Persona
        return data.map((item) => Persona.fromJson(item)).toList();
      } else {
        print(
            '❌ [getListPersonasObject] Error en la petición: Código de estado ${res.statusCode}');
        return [];
      }
    } catch (e) {
      print(
          '❌ [getListPersonasObject] Ocurrió un error al realizar la petición: $e');
      return [];
    }
  }

  // -----------------------------------------------------
  // MARK: - Ejercicio 2: Trabajar con Recursos
  // -----------------------------------------------------

  Future<List<Recurso>> getListRecursosObject() async {
    final url = Uri.parse('$baseUrl/unknown'); // Endpoint: /api/resource

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        final jsonResponse = json.decode(res.body);
        final data = jsonResponse['data'] as List;

        // Mapeamos la lista 'data' a objetos Recurso
        return data.map((item) => Recurso.fromJson(item)).toList();
      } else {
        print(
            '❌ [getListRecursosObject] Error en la petición: Código de estado ${res.statusCode}');
        return [];
      }
    } catch (e) {
      print(
          '❌ [getListRecursosObject] Ocurrió un error al realizar la petición: $e');
      return [];
    }
  }

  // -----------------------------------------------------
  // MARK: - Ejercicio 3: Integrar con Modelo Genérico
  // -----------------------------------------------------

  // Obtener lista de Personas usando el modelo genérico
  Future<ApiResponse<List<Persona>>?> getListPersonasWithGenericModel() async {
    final url = Uri.parse('$baseUrl/users?page=1');

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        final jsonResponse = json.decode(res.body);

        // Función de mapeo: Toma el valor de 'data' (que es una List) y lo convierte a List<Persona>
        List<Persona> personaMapper(dynamic data) {
          return (data as List).map((item) => Persona.fromJson(item)).toList();
        }

        return ApiResponse<List<Persona>>.fromJson(jsonResponse, personaMapper);
      } else {
        print(
            '❌ [getListPersonasWithGenericModel] Error en la petición: Código de estado ${res.statusCode}');
        return null;
      }
    } catch (e) {
      print(
          '❌ [getListPersonasWithGenericModel] Ocurrió un error al realizar la petición: $e');
      return null;
    }
  }

  // -----------------------------------------------------
  // MARK: - Pruebas
  // -----------------------------------------------------

  Future<void> testUsersEndpoints() async {
    // Prueba de obtención de un solo usuario (EXITO)
    final user1 = await getSingleUserObject(2);
    if (user1 != null) {
      print(
          '✅ Usuario encontrado (ID 2): ${user1.firstName} ${user1.lastName}');
    }

    // Prueba de obtención de un solo usuario (ERROR 404)
    // 💡 Prueba tus peticiones con IDs inexistentes para validar los errores.
    final user404 = await getSingleUserObject(999);
    if (user404 == null) {
      // El mensaje de error ya se imprime dentro de la función.
    }

    // Prueba de obtención de lista de usuarios
    final users = await getListPersonasObject();
    if (users.isNotEmpty) {
      print(
          '✅ Lista de ${users.length} usuarios obtenida. Primer usuario: ${users.first.email}');
    }
  }

  Future<void> testResourceEndpoint() async {
    final resources = await getListRecursosObject();

    if (resources.isNotEmpty) {
      print('✅ Lista de ${resources.length} recursos obtenida:');
      // Tarea 4: Imprimir por consola los valores formateados
      for (var r in resources) {
        print('  - ${r.name} (ID: ${r.id}, Color: ${r.color})');
      }
    }
    // Para probar el 404, se necesitaría un endpoint que lo devuelva, o
    // simularlo modificando la URL con un '/unknown/999' que devuelve 404.
  }

  Future<void> testGenericApiResponse() async {
    final apiResponse = await getListPersonasWithGenericModel();

    if (apiResponse != null) {
      print('✅ Respuesta genérica obtenida:');
      print('  - Página: ${apiResponse.page} de ${apiResponse.totalPages}');
      print('  - Total de registros: ${apiResponse.total}');
      print(
          '  - Contenido (data) de la lista: ${apiResponse.data.length} elementos');
      print('  - Tipo de datos: ${apiResponse.data.runtimeType}');
    }
  }
}
