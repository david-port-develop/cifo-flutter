import 'dart:io';
import 'dart:math';

// =============================================
// BLOQUE 1: Funciones básicas y con retorno
// =============================================

// 1. Función sin parámetros ni retorno
void holaMundo() {
  print('Hola, mundo');
}
// Lógica: Función void simple que ejecuta un print básico

// 2. Función con parámetro para saludo personalizado
void saludarPersonalizado(String nombre) {
  print('Hola, $nombre! Bienvenido/a');
}
// Lógica: Concatenación de string con parámetro para personalización

// 3. Función que retorna suma de dos números
int sumar(int a, int b) {
  return a + b;
}

// Lógica: Operación aritmética básica con retorno de resultado
//Todas las funciones que solo tienen un return se puede usar la notación de flecha, por ejemplo:
sumarflechas(int a, int b) => a + b;

// 4. Función que calcula promedio de tres notas
double calcularPromedio(double a, double b, double c) {
  return (a + b + c) / 3;
}
// Lógica: Cálculo de media aritmética con división por cantidad

// 5. Función que verifica si un número es par
bool esPar(int numero) {
  return numero % 2 == 0;
}
// Lógica: Uso de módulo para determinar paridad con retorno booleano

// 6. Función que cuenta caracteres de un texto
int contarCaracteres(String texto) {
  return texto.length;
}
// Lógica: Acceso a propiedad length para obtener tamaño del string

// 7. Función que calcula factorial
int factorial(int n) {
  int resultado = 1;
  for (int i = 1; i <= n; i++) {
    resultado *= i;
  }
  return resultado;
}
// Lógica: Multiplicación acumulativa en bucle para cálculo factorial

// 8. Función que encuentra el mayor de dos números
int encontrarMayor(int a, int b) {
  if (a > b) {
    return a;
  } else {
    return b;
  }
}
// Lógica: Comparación condicional para determinar valor máximo

// 9. Función que suma precios de una lista
double calcularTotal(List<double> precios) {
  double total = 0;
  for (double precio in precios) {
    total += precio;
  }
  return total;
}
// Lógica: Iteración con acumulador para suma de elementos de lista

// 10. Función que convierte texto a mayúsculas
String aMayusculas(String texto) {
  return texto.toUpperCase();
}
// Lógica: Transformación de string a mayúsculas usando método nativo

// =============================================
// BLOQUE 2: Tipos de argumentos
// =============================================

// 1. Función con parámetro opcional
void saludarOpcional([String? nombre]) {
  if (nombre == null || nombre.isEmpty) {
    print('Hola desconocido!');
  } else {
    print('Hola $nombre!');
  }
}
// Lógica: Validación de null y string vacío para parámetro opcional

// 2. Función con parámetros nombrados
void mostrarDatos({required String nombre, required int edad}) {
  // Validar datos antes de usarlos
  if (nombre.isEmpty) {
    print('Error: El nombre no puede estar vacío');
    return;
  }
  if (edad < 0 || edad > 150) {
    print('Error: La edad debe estar entre 0 y 150 años');
    return;
  }
  print('Nombre: $nombre, Edad: $edad');
}
// Lógica: Validación de rangos y valores vacíos en parámetros required

// 3. Función con validación de parámetro opcional
void mensajeError([String? mensaje]) {
  if (mensaje == null || mensaje.isEmpty) {
    print('Error: No se proporcionó mensaje válido');
  } else {
    print('Mensaje: $mensaje');
  }
}
// Lógica: Validación de null y string vacío

// 4. Función con parámetro con valor por defecto
void mostrarInfo(String nombre, int edad, [String? pais]) {
  // Validar parámetros obligatorios
  if (nombre.isEmpty) {
    print('Error: El nombre es obligatorio');
    return;
  }
  if (edad <= 0) {
    print('Error: La edad debe ser positiva');
    return;
  }

  // Usar valor por defecto si no se proporciona país
  String paisMostrar = pais ?? "España";
  print('$nombre, $edad años, de $paisMostrar');
}
// Lógica: Validación de parámetros obligatorios y manejo de opcionales

// 5. Función que verifica si lista contiene número
bool contieneNumero(List<int>? lista, int numero) {
  if (lista == null || lista.isEmpty) {
    print('Error: La lista está vacía o es nula');
    return false;
  }
  return lista.contains(numero);
}
// Lógica: Validación de lista nula o vacía

// 6. Función que repite texto
void repetirTexto(String texto, [int? repeticiones]) {
  // Validar texto
  if (texto.isEmpty) {
    print('Error: El texto no puede estar vacío');
    return;
  }

  // Usar valor por defecto si no se proporciona
  int repeticionesValidas = repeticiones ?? 1;

  // Validar repeticiones
  if (repeticionesValidas <= 0) {
    print('Error: Las repeticiones deben ser mayor a 0');
    return;
  }

  for (int i = 0; i < repeticionesValidas; i++) {
    print(texto);
  }
}
// Lógica: Validación completa de todos los parámetros

// 7. Función con múltiples parámetros opcionales
double? mediaOpcional([int? a, int? b, int? c]) {
  List<int> numeros = [];

  // Solo agregar números no nulos
  if (a != null) numeros.add(a);
  if (b != null) numeros.add(b);
  if (c != null) numeros.add(c);

  // Validar que tenemos al menos un número
  if (numeros.isEmpty) {
    print('Error: Se requiere al menos un número para calcular la media');
    return null;
  }

  // Calcular suma
  int suma = 0;
  for (int numero in numeros) {
    suma += numero;
  }

  return suma / numeros.length;
}
// Lógica: Validación de que al menos un parámetro no sea null

// 8. Función que accede a elemento de lista con control de rango
dynamic obtenerElemento(List? lista, int indice) {
  if (lista == null || lista.isEmpty) {
    return 'Error: La lista está vacía o es nula';
  }
  if (indice < 0 || indice >= lista.length) {
    return 'Error: Índice $indice fuera de rango (0-${lista.length - 1})';
  }
  return lista[indice];
}
// Lógica: Validación de lista nula/vacía y rango de índice

// 9. Función con múltiples parámetros nombrados
String crearPerfil({String? nombre, int? edad, bool? activo}) {
  // Validar parámetros requeridos
  if (nombre == null || nombre.isEmpty) {
    return 'Error: El nombre es obligatorio';
  }
  if (edad == null || edad < 0 || edad > 150) {
    return 'Error: La edad debe estar entre 0 y 150 años';
  }

  // Valor por defecto para activo
  bool estadoActivo = activo ?? true;
  String estado = estadoActivo ? 'activo' : 'inactivo';

  return '$nombre, $edad años - $estado';
}
// Lógica: Validación completa de parámetros nombrados

// 10. Función que combina parámetros posicionales y nombrados
void mostrarCombinado(String nombre, {int? edad, String? ciudad}) {
  // Validar parámetro obligatorio
  if (nombre.isEmpty) {
    print('Error: El nombre es obligatorio');
    return;
  }

  // Valores por defecto para parámetros nombrados
  int edadMostrar = edad ?? 0;
  String ciudadMostrar = ciudad ?? "Desconocida";

  // Validar rangos
  if (edadMostrar < 0) {
    print('Error: La edad no puede ser negativa');
    return;
  }

  print('$nombre, $edadMostrar años, de $ciudadMostrar');
}
// Lógica: Validación de parámetro obligatorio y manejo de opcionales

// =============================================
// BLOQUE 3: Funciones async, await y Future
// =============================================

// 1. Función async que devuelve mensaje después de delay
Future<String> mensajeConRetraso() async {
  await Future.delayed(Duration(seconds: 2));
  return "Mensaje listo después de 2 segundos";
}
// Lógica: Espera asíncrona con delayed antes de retornar resultado

// 2. Función async que simula descarga
Future<void> simularDescarga() async {
  print('Iniciando descarga...');
  await Future.delayed(Duration(seconds: 5));
  print('Descarga completada');
}
// Lógica: Simulación de proceso largo con await para pausa controlada

// 3. Función async que calcula cuadrado con retraso
Future<int> cuadradoConRetraso(int numero) async {
  await Future.delayed(Duration(seconds: 1));
  return numero * numero;
}
// Lógica: Cálculo sencillo precedido por espera asíncrona

// 4. Función que combina sync y async
Future<int> procesarNumero(int numero) async {
  // Función sincrónica auxiliar
  int duplicar(int n) => n * 2;

  int resultado = duplicar(numero);
  await Future.delayed(Duration(seconds: 1));
  return resultado;
}
// Lógica: Integración de lógica síncrona dentro de flujo asíncrono

// 5. Función async que procesa lista con pausas
Future<void> procesarLista(List<String> elementos) async {
  for (String elemento in elementos) {
    print('Procesando: $elemento');
    await Future.delayed(Duration(seconds: 1));
  }
  print('Procesamiento completado');
}
// Lógica: Iteración con pausas asíncronas entre cada elemento

// 6. Función que espera múltiples Futures
Future<String> combinarFutures() async {
  String dato1 = await _obtenerDato1();
  String dato2 = await _obtenerDato2();
  String dato3 = await _obtenerDato3();

  return '$dato1 - $dato2 - $dato3';
}

Future<String> _obtenerDato1() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Dato1';
}

Future<String> _obtenerDato2() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Dato2';
}

Future<String> _obtenerDato3() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Dato3';
}
// Lógica: Ejecución secuencial de múltiples operaciones asíncronas

// 7. Función async que calcula área de círculo
Future<double> areaCirculoConRetraso(double radio) async {
  await Future.delayed(Duration(seconds: 2));
  return 3.1416 * radio * radio;
}
// Lógica: Cálculo matemático con simulación de procesamiento largo

// 8. Función async que simula validación de login
Future<String> validarLogin(String usuario, String contrasena) async {
  await Future.delayed(Duration(seconds: 2));

  if (usuario == 'admin' && contrasena == '1234') {
    return 'Acceso permitido';
  } else {
    return 'Acceso denegado';
  }
}
// Lógica: Validación condicional después de simulación de delay

// 9. Función con bucle y llamadas async
Future<void> procesoPorPasos(List<String> pasos) async {
  for (int i = 0; i < pasos.length; i++) {
    print('Paso ${i + 1}: ${pasos[i]}');
    await _simularPaso();
  }
  print('Proceso completado');
}

Future<void> _simularPaso() async {
  await Future.delayed(Duration(seconds: 1));
}
// Lógica: Control secuencial de pasos con esperas asíncronas

// 10. Función main async que coordina tareas
Future<void> main() async {
  print('=== INICIANDO PROGRAMA PRINCIPAL ===');

  await ejecutarEjerciciosAsync();

  print('=== PROGRAMA COMPLETADO ===');
}

// =============================================
// BLOQUE 4: Manejo de errores con try y catch
// =============================================

// 1. División con manejo de errores
void dividirConManejo(int a, int b) {
  try {
    double resultado = a / b;
    print('Resultado: $resultado');
  } catch (e) {
    print('Error: No se puede dividir por cero');
  }
}
// Lógica: Captura de excepción por división entre cero

// 2. Función con retorno seguro de cociente
double? cocienteSeguro(int a, int b) {
  try {
    return a / b;
  } catch (e) {
    return null;
  }
}
// Lógica: Retorno condicional null en caso de error

// 3. Conversión de texto a número con manejo de errores
int? convertirTextoANumero(String texto) {
  try {
    return int.parse(texto);
  } catch (e) {
    print('Error: "$texto" no es un número válido');
    return null;
  }
}
// Lógica: Validación de formato numérico con parse protegido

// 4. Lectura segura de número desde teclado
int? leerNumeroSeguro(String mensaje) {
  print(mensaje);
  try {
    String? input = stdin.readLineSync();
    return int.parse(input!);
  } catch (e) {
    print('Error: Entrada no válida');
    return null;
  }
}
// Lógica: Captura de errores en entrada de usuario con parse

// 5. Acceso seguro a elemento de lista
dynamic accesoListaSeguro(List lista, int indice) {
  try {
    return lista[indice];
  } catch (e) {
    return 'Error: Índice $indice fuera de rango (0-${lista.length - 1})';
  }
}
// Lógica: Protección contra acceso fuera de límites de lista

// 6. Simulación de apertura de archivo con error
void simularAbrirArchivo(String nombreArchivo) {
  try {
    if (!nombreArchivo.endsWith('.txt')) {
      throw Exception('Archivo no encontrado: $nombreArchivo');
    }
    print('Archivo $nombreArchivo abierto correctamente');
  } catch (e) {
    print('Error: $e');
  }
}
// Lógica: Lanzamiento y captura de excepción personalizada

// 7. Cálculo de raíz cuadrada con validación
double? raizCuadradaSegura(double numero) {
  try {
    if (numero < 0) {
      throw Exception('No se puede calcular raíz de número negativo');
    }
    return double.parse((sqrt(numero)).toStringAsFixed(2));
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
// Lógica: Validación previa y lanzamiento de excepción controlada

// 8. Función async con manejo de error en Future
Future<void> futureConError() async {
  try {
    await Future.delayed(Duration(seconds: 1));
    throw Exception('Error simulado en Future');
  } catch (e) {
    print('Error capturado: $e');
  }
}
// Lógica: Captura de excepciones en operaciones asíncronas

// 9. Manejo de diferentes tipos de excepciones
void manejoMultipleErrores(String texto, int indice) {
  try {
    int numero = int.parse(texto);
    List<int> lista = [1, 2, 3];
    print('Elemento: ${lista[indice]}');
    print('Número: $numero');
  } on FormatException {
    print('Error: Formato de texto inválido');
  } on RangeError catch (e) {
    print('Error de rango: $e');
  } catch (e) {
    print('Error inesperado: $e');
  }
}
// Lógica: Captura específica por tipo de excepción

// 10. Análisis detallado de errores
void analizarError(dynamic operacionPeligrosa) {
  try {
    operacionPeligrosa();
  } catch (e) {
    if (e is FormatException) {
      print('Error de formato: Verifique la entrada');
    } else if (e is RangeError) {
      print('Error de rango: Índice fuera de límites');
    } else if (e is IntegerDivisionByZeroException) {
      print('Error matemático: División por cero');
    } else {
      print('Error desconocido: $e');
    }
  }
}
// Lógica: Clasificación de errores por tipo para mensajes específicos

// =============================================
// FUNCIÓN PRINCIPAL PARA EJECUTAR EJERCICIOS
// =============================================

//aprovecho la función principal para hacer el ejercicio 10 del BLOQUE 3
Future<void> ejecutarEjerciciosAsync() async {
  print('\n--- BLOQUE 1: Funciones básicas ---');
  holaMundo();
  saludarPersonalizado('Ana');
  print('Suma: ${sumar(5, 3)}');
  print('Promedio: ${calcularPromedio(7.5, 8.0, 6.5)}');
  print('¿Es 10 par? ${esPar(10)}');
  print('Caracteres en "Hola": ${contarCaracteres("Hola")}');
  print('Factorial de 5: ${factorial(5)}');
  print('Mayor entre 8 y 12: ${encontrarMayor(8, 12)}');

  List<double> precios = [10.5, 25.0, 8.75];
  print('Total precios: ${calcularTotal(precios)}');
  print('Mayúsculas: ${aMayusculas("hola mundo")}');

  print('\n--- BLOQUE 2: Tipos de argumentos ---');
  saludarOpcional();
  saludarOpcional('Carlos');
  mostrarDatos(nombre: 'María', edad: 25);
  //Sin texto
  mensajeError();
  //Con texto
  mensajeError('Todo bien');
  mostrarInfo('Juan', 30);
  mostrarInfo('Lisa', 28, 'Francia');

  List<int> numeros = [1, 2, 3, 4, 5];
  print('¿Contiene 3? ${contieneNumero(numeros, 3)}');
  repetirTexto('Hola nena', 3);
  print(
      'Media en función con parámetros opcionales: ${mediaOpcional(10, 20, 30)}');
  print('Elemento lista: ${obtenerElemento(numeros, 2)}');
  print('Perfil: ${crearPerfil(nombre: 'Pedro', edad: 35, activo: true)}');
  mostrarCombinado('Ana', edad: 25, ciudad: 'Madrid');

  print('\n--- BLOQUE 3: Funciones async ---');
//1
  String mensaje = await mensajeConRetraso();
  print(mensaje);
//2
  await simularDescarga();
//3
  int cuadrado = await cuadradoConRetraso(5);
  print('Cuadrado: $cuadrado');
//4
  int procesado = await procesarNumero(7);
  print('Número procesado: $procesado');
//5
  await procesarLista(['A', 'B', 'C']);
//6
  String datosCombinados = await combinarFutures();
  print('Datos combinados: $datosCombinados');
//7
  double area = await areaCirculoConRetraso(5.0);
  print('Área círculo: $area');
//8
  String login = await validarLogin('admin', '1234');
  print('Validación login: $login');
//9
  await procesoPorPasos(['Inicio', 'Proceso', 'Fin']);

  print('\n--- BLOQUE 4: Manejo de errores ---');
  //1
  dividirConManejo(10, 2);
  dividirConManejo(10, 0);
//2
  print('Cociente seguro: ${cocienteSeguro(10, 2)}');
  print('Cociente seguro: ${cocienteSeguro(10, 0)}');

  print('Número convertido: ${convertirTextoANumero("123")}');
  print('Número convertido: ${convertirTextoANumero("abc")}');

  // Simulación de lectura (comentado para no interrumpir flujo)
  // int? numeroLeido = leerNumeroSeguro('Ingresa un número:');
  // print('Número leído: $numeroLeido');

  print('Acceso lista: ${accesoListaSeguro(numeros, 2)}');
  print('Acceso lista: ${accesoListaSeguro(numeros, 10)}');

  simularAbrirArchivo('documento.txt');
  simularAbrirArchivo('imagen.jpg');

  print('Raíz cuadrada: ${raizCuadradaSegura(16)}');
  print('Raíz cuadrada: ${raizCuadradaSegura(-4)}');

  await futureConError();

  manejoMultipleErrores('123', 1);
  manejoMultipleErrores('abc', 1);
  manejoMultipleErrores('123', 10);

  analizarError(() => int.parse('123'));
  analizarError(() => int.parse('abc'));
}
