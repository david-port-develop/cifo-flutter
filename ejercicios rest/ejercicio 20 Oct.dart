import 'dart:convert';
import 'dart:io';
import 'classUser.dart';
import 'package:http/http.dart' as http;

Future<Map<String, String>> loadConfigHeaders() async {
  // Require a dedicated file with only the API key. Resolve it relative to the
  // script location (not the current working directory), then fail fast if
  // missing or invalid.
  final scriptDir = File(Platform.script.toFilePath()).parent.path;
  final apiKeyPath = '$scriptDir/config/apikey.json';
  final apiKeyFile = File(apiKeyPath);
  if (!await apiKeyFile.exists()) {
    throw Exception('Required config file not found: $apiKeyPath');
  }

  final contents = await apiKeyFile.readAsString();
  final Map<String, dynamic> json = jsonDecode(contents);
  final String? apiKey = json['apiKey'] as String?;
  final String baseUrl = json['baseUrl'] as String? ?? 'https://reqres.in';

  if (apiKey == null || apiKey.isEmpty) {
    throw Exception('apiKey missing or empty in $apiKeyPath');
  }

  print('Loaded apiKey config from $apiKeyPath: baseUrl=$baseUrl');
  return {'apiKey': apiKey, 'baseUrl': baseUrl};
}

Future<void> getReqRespService() async {
  final cfg = await loadConfigHeaders();
  final baseUrl = cfg['baseUrl']!;
  final apiKey = cfg['apiKey']!;

  final urlString = '$baseUrl/api/users';
  final url = Uri.parse(urlString);
  final headers = <String, String>{};
  if (apiKey.isNotEmpty) headers['x-api-key'] = apiKey;
  try {
    final res = await http.get(url, headers: headers);
    if (res.statusCode != 200) {
      throw Exception('HTTP ${res.statusCode}: ${res.reasonPhrase}');
    }
    final body = jsonDecode(res.body) as Map<String, dynamic>;
    final List<dynamic> data = body['data'] as List<dynamic>;
    print(data);
    final users = data.map((e) => User.fromJson(e)).toList();
    for (var user in users) {
      print(user.id);
    }
    print(url);
  } catch (e) {
    print('Error in getReqRespService: $e');
    rethrow;
  }
}

Future<User> getSingleUser(int id) async {
  final cfg = await loadConfigHeaders();
  final baseUrl = cfg['baseUrl']!;
  final apiKey = cfg['apiKey']!;

  final urlString = '$baseUrl/api/users/$id';
  final url = Uri.parse(urlString);
  final headers = <String, String>{};
  if (apiKey.isNotEmpty) headers['x-api-key'] = apiKey;
  //Solo en caso de 200
  try {
    final res = await http.get(url, headers: headers);
    if (res.statusCode == 404) {
      throw Exception('User with id $id not found (404)');
    }
    if (res.statusCode != 200) {
      throw Exception('HTTP ${res.statusCode}: ${res.reasonPhrase}');
    }
    print(url);
    final body = jsonDecode(res.body) as Map<String, dynamic>;
    print('${body['data']}');
    final user = User.fromJson(body['data']);
    return (user);
  } catch (e) {
    print('Error in getSingleUser($id): $e');
    rethrow;
  }
}

Future<User?> getSingleUserObject(int id) async {
  try {
    final user = getSingleUser(id);
    return (user);
  } catch (e) {
    print('Error in getSingleUserObject: $e');
    return null;
  }
}

Future<List<User>> getListUsersObject() async {
  try {
    await getReqRespService();
    return <User>[];
  } catch (e) {
    print('Error in getListUsersObject: $e');
    return <User>[];
  }
}

void main() async {
  await getReqRespService();
  await getSingleUser(2);
}
