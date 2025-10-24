import 'dart:convert';
import 'package:http/http.dart' as http;

// =============================================
// MODELO DE DATOS
// =============================================

/// Representa la estructura de un usuario (Persona) de la API reqres.in.
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

  /// Constructor factory para crear una instancia de [Persona] desde un mapa JSON.
  /// Maneja la conversión de las claves del JSON (ej. 'first_name') a los
  /// atributos de la clase.
  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      id: json['id'] as int,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      avatar: json['avatar'] as String,
    );
  }

  /// Sobrescribe el método toString para una representación legible del objeto.
  @override
  String toString() {
    return 'Persona(id: $id, nombre: $firstName $lastName, email: $email)';
  }
}

/// Tarea 1: Representa la estructura de un recurso (Resource) de la API.
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

  /// Constructor factory para crear una instancia de [Recurso] desde un mapa JSON.
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
    return 'Recurso(id: $id, name: "$name", year: $year, color: $color)';
  }
}

// =============================================
// SERVICIO DE API
// =============================================

/// Centraliza las peticiones a la API de reqres.in.
/// Es una buena práctica para mantener el código organizado y reutilizable.
class ReqResService {
  static const String _baseUrl = "https://reqres.in/api";
  static const Map<String, String> _headers = {
    'x-api-key': 'reqres-free-v1',
  };

  /// Tarea 1: Obtener un único usuario por su ID.
  ///
  /// Devuelve un objeto [Persona] si la petición es exitosa (código 200).
  /// Devuelve `null` si el usuario no se encuentra (código 404) o si ocurre
  /// otro error en la petición.
  Future<Persona?> getSingleUserObject(int id) async {
    final url = Uri.parse('$_baseUrl/users/$id');

    // Tarea 4: Aplicar try/catch para manejar errores de red.
    try {
      final response = await http.get(url, headers: _headers);

      // Tarea 4: Mostrar mensajes según el statusCode.
      if (response.statusCode == 200) {
        // Tarea 3: Decodificar el JSON.
        final jsonResponse = json.decode(response.body);
        // La API devuelve el usuario dentro de una clave "data".
        final userData = jsonResponse['data'] as Map<String, dynamic>;
        // Tarea 3: Mapear a la clase Persona.
        return Persona.fromJson(userData);
      } else if (response.statusCode == 404) {
        print('-> Usuario con ID $id no encontrado (Error 404).');
        return null;
      } else {
        print(
            '-> Error en la petición para el usuario $id: Código ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('-> Ocurrió un error de red al buscar el usuario $id: $e');
      return null;
    }
  }

  /// Tarea 2: Obtener la lista de usuarios.
  ///
  /// Devuelve una lista de objetos [Persona].
  /// Si la petición falla, devuelve una lista vacía.
  Future<List<Persona>> getListPersonasObject() async {
    // Usamos el endpoint con paginación, por ejemplo, la página 1.
    final url = Uri.parse('$_baseUrl/users?page=1');

    try {
      // Tarea 2: Implementar la petición con http.get.
      final response = await http.get(url, headers: _headers);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        // La API devuelve la lista de usuarios dentro de la clave "data".
        final List<dynamic> data = jsonResponse['data'] as List<dynamic>;

        // Tarea 3: Mapear cada elemento de la lista a un objeto Persona.
        return data
            .map((item) => Persona.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        print(
            '-> Error al obtener la lista de usuarios: Código ${response.statusCode}');
        return []; // Devolvemos una lista vacía en caso de error.
      }
    } catch (e) {
      print('-> Ocurrió un error de red al obtener la lista de usuarios: $e');
      return [];
    }
  }

  // --- MÉTODOS PARA EJERCICIO 2: RECURSOS ---

  /// Tarea 2: Obtener la lista de recursos.
  /// El endpoint para recursos es '/resource'.
  Future<List<Recurso>> getListRecursosObject() async {
    final url = Uri.parse('$_baseUrl/resource');

    try {
      final response = await http.get(url, headers: _headers);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data'] as List<dynamic>;

        return data
            .map((item) => Recurso.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        print(
            '-> Error al obtener la lista de recursos: Código ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('-> Ocurrió un error de red al obtener la lista de recursos: $e');
      return [];
    }
  }

  /// Método auxiliar para obtener un único recurso y probar el error 404.
  Future<Recurso?> getSingleRecursoObject(int id) async {
    final url = Uri.parse('$_baseUrl/resource/$id');

    try {
      final response = await http.get(url, headers: _headers);

      // Tarea 4: Manejo de errores 200 y 404.
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final resourceData = jsonResponse['data'] as Map<String, dynamic>;
        return Recurso.fromJson(resourceData);
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
  print('--- Iniciando Ejercicio 1: Usuarios ---');

  final reqResService = ReqResService();

  // --- Prueba 1: Obtener una lista de usuarios ---
  print('\n1. Obteniendo lista de usuarios...');
  final List<Persona> usuarios = await reqResService.getListPersonasObject();

  if (usuarios.isNotEmpty) {
    print('✅ Se encontraron ${usuarios.length} usuarios.');
    // Imprimimos solo el primer usuario como ejemplo.
    print('   Primer usuario: ${usuarios.first}');
  } else {
    print('❌ No se pudo obtener la lista de usuarios.');
  }

  // --- Prueba 2: Obtener un usuario específico (caso de éxito) ---
  print('\n2. Obteniendo usuario con ID = 2...');
  final Persona? usuarioExitoso = await reqResService.getSingleUserObject(2);

  if (usuarioExitoso != null) {
    print('✅ Usuario encontrado: $usuarioExitoso');
  } else {
    print('❌ No se pudo encontrar el usuario con ID 2.');
  }

  // --- Prueba 3: Intentar obtener un usuario que no existe (caso de error 404) ---
  print('\n3. Obteniendo usuario con ID = 999 (inexistente)...');
  final Persona? usuarioFallido = await reqResService.getSingleUserObject(999);

  if (usuarioFallido == null) {
    print('✅ El manejo de error 404 funcionó como se esperaba.');
  } else {
    print('❌ Algo salió mal, se obtuvo un usuario que no debería existir.');
  }

  print('\n\n--- Iniciando Ejercicio 2: Recursos ---');

  // --- Prueba 4: Obtener lista de recursos (caso de éxito 200) ---
  print('\n4. Obteniendo lista de recursos...');
  final List<Recurso> recursos = await reqResService.getListRecursosObject();

  if (recursos.isNotEmpty) {
    print('✅ Se encontraron ${recursos.length} recursos.');
    // Tarea 3: Imprimir por consola los valores formateados.
    print('   Recursos encontrados:');
    for (final recurso in recursos) {
      print(
          '   - ${recurso.name} (Año: ${recurso.year}, Color: ${recurso.color})');
    }
  } else {
    print('❌ No se pudo obtener la lista de recursos.');
  }

  // --- Prueba 5: Obtener un recurso que no existe (caso de error 404) ---
  print('\n5. Obteniendo recurso con ID = 23 (inexistente)...');
  final Recurso? recursoFallido =
      await reqResService.getSingleRecursoObject(23);

  if (recursoFallido == null) {
    print('✅ El manejo de error 404 para recursos funcionó como se esperaba.');
  } else {
    print('❌ Algo salió mal, se obtuvo un recurso que no debería existir.');
  }

  print('\n--- Todos los ejercicios completados ---');
}
