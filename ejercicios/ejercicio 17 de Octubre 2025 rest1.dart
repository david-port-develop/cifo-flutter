
  import 'dart:convert';
import 'package:http/http.dart' as http; // Necesitas agregar http a tu pubspec.yaml

class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String? avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.avatar,
  });

  // 💡 Constructor factory para crear una instancia de User desde un mapa JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      email: json['email'] as String,
      firstName: json['first_name'] as String, // ⚠️ Observa la clave JSON típica
      lastName: json['last_name'] as String,   // ⚠️ Observa la clave JSON típica
      avatar: json['avatar'] as String?,
    );
  }

  // 💡 Método para listar los datos del objeto (útil para imprimir)
  @override
  String toString() {
    return 'User(id: $id, name: $firstName $lastName, email: $email, avatar: $avatar)';
  }
}

void main {


// ⚠️ Este es el paso clave: mapear el JSON a una lista de objetos User.
List<User> parseUsers(String responseBody) {
  // 1. Decodificar la cadena JSON a un Map (o List, dependiendo del formato de la API).
  final Map<String, dynamic> decodedJson = jsonDecode(responseBody);
  
  // 2. Extraer la lista de usuarios (asumiendo que está en la clave 'data')
  final List<dynamic> userListJson = decodedJson['data'];

  // 3. Usar el constructor 'User.fromJson' para convertir cada mapa JSON a un objeto User.
  return userListJson.map((json) => User.fromJson(json as Map<String, dynamic>)).toList();
}

// 🌐 Función de ejemplo para obtener los datos de la API (usando un endpoint de prueba)
Future<List<User>> fetchUsers() async {
  const String url = 'https://reqres.in/api/users?page=1'; // Ejemplo de URL REST
  
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Si el servidor devuelve una respuesta "OK" (status 200),
      // procesamos el JSON.
      return parseUsers(response.body);
    } else {
      // Si la respuesta no fue 200, lanza un error.
      throw Exception('Failed to load users. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching users: $e');
  }
}

}