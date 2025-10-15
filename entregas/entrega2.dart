import '../ejercicios/funciones_comunes.dart';

// Función para el Ejercicio 8
String saludar(String nombre) {
  return '¡Hola $nombre! Es un placer saludarte.';
}
// Lógica: Función que recibe parámetro y retorna string personalizado

void main() {
  print('=== ENTREGA SEMANA 2 - EJERCICIOS DART ===');

  // Ejercicio 1: Hola, Dart
  print('\n--- Ejercicio 1: Hola, Dart ---');
  print('Hola, bienvenido al mundo de Dart!');
  // Lógica: Uso simple de print() para mostrar mensaje estático en consola

  // Ejercicio 2: Variables básicas
  print('\n--- Ejercicio 2: Variables básicas ---');
  String nombre = "David";
  int edad = 56;
  double altura = 1.75;
  print('Mi nombre es $nombre, tengo $edad años y mido $altura metros.');
  // Lógica: Declaración de variables con tipos específicos e interpolación en strings

  // Ejercicio 3: Operaciones matemáticas
  print('\n--- Ejercicio 3: Operaciones matemáticas ---');
  int numero1 = pedirNumero('Ingresa el primer número:');
  int numero2 = pedirNumero('Ingresa el segundo número:');

  print('Suma: $numero1 + $numero2 = ${numero1 + numero2}');
  print('Resta: $numero1 - $numero2 = ${numero1 - numero2}');
  print('Multiplicación: $numero1 * $numero2 = ${numero1 * numero2}');

  if (numero2 != 0) {
    var division = numero1 / numero2;
    var divisionEU = formatearDouble(division);
    print('División: $numero1 ÷ $numero2 = ${divisionEU}');
  } else {
    print('División: No se puede dividir por cero');
  }
  // Lógica: Operaciones aritméticas básicas con validación de división por cero

  // Ejercicio 4: Condicional simple
  print('\n--- Ejercicio 4: Condicional simple ---');
  int numero = pedirNumero('Ingresa un número:');

  if (numero > 0) {
    print('$numero es positivo');
  } else if (numero < 0) {
    print('$numero es negativo');
  } else {
    print('El número es cero');
  }
  // Lógica: Estructura condicional if-else if-else para clasificar números

  // Ejercicio 5: Bucle for
  print('\n--- Ejercicio 5: Bucle for ---');
  print('Números del 1 al 10:');
  for (int i = 1; i <= 10; i++) {
    print(i);
  }
  // Lógica: Bucle for con contador incremental para secuencia numérica

  // Ejercicio 6: Bucle con condición
  print('\n--- Ejercicio 6: Bucle con condición ---');
  int numeroTabla = pedirNumero(
    'Ingresa un número para ver su tabla de multiplicar:',
  );
  print('Tabla de multiplicar del $numeroTabla:');

  for (int i = 1; i <= 10; i++) {
    print('$numeroTabla × $i = ${numeroTabla * i}');
  }
  // Lógica: Bucle for para generar tabla multiplicativa con formato claro

  // Ejercicio 7: Listas
  print('\n--- Ejercicio 7: Listas ---');
  List<String> frutas = ['Manzana', 'Banana', 'Naranja', 'Uva', 'Pera'];
  print('Mis frutas favoritas:');

  for (String fruta in frutas) {
    print('- $fruta');
  }
  // Lógica: Iteración con for-in sobre lista para mostrar elementos individualmente

  // Ejercicio 8: Funciones
  print('\n--- Ejercicio 8: Funciones ---');
  String nombreUsuario = pedirTexto('Ingresa tu nombre:');
  String saludo = saludar(nombreUsuario);
  print(saludo);
  // Lógica: Definición y llamada de función personalizada con parámetro

  // Ejercicio 9: Par o impar
  print('\n--- Ejercicio 9: Par o impar ---');
  int numeroParImpar = pedirNumero(
    'Ingresa un número para verificar si es par o impar:',
  );

  if (numeroParImpar % 2 == 0) {
    print('$numeroParImpar es un número par');
  } else {
    print('$numeroParImpar es un número impar');
  }
  // Lógica: Uso de operador módulo para determinar paridad numérica

  // Ejercicio 10: Promedio de notas
  print('\n--- Ejercicio 10: Promedio de notas ---');
  double nota1 = pedirDouble('Ingresa la primera nota (0-10):');
  double nota2 = pedirDouble('Ingresa la segunda nota (0-10):');
  double nota3 = pedirDouble('Ingresa la tercera nota (0-10):');

  double promedio = (nota1 + nota2 + nota3) / 3;
  String resultado = promedio >= 5 ? 'Aprobado' : 'Suspendido';

  print(
    'Notas: ${formatearDouble(nota1)}, ${formatearDouble(nota2)}, ${formatearDouble(nota3)}',
  );
  print('Promedio: ${formatearDouble(promedio)}');
  print('Resultado: ${resultado}');
  // Lógica: Cálculo de promedio y uso de operador ternario para decisión binaria
}
