import 'dart:io';
import 'package:intl/intl.dart';

// Función pedirDouble mejorada con soporte para formato europeo
double pedirDouble(String mensaje) {
  double? numero;

  while (numero == null) {
    print(mensaje);
    print('(Formato europeo: ej: 1234,56 o 1.234,56)');

    String? input = stdin.readLineSync();

    if (input != null && input.isNotEmpty) {
      try {
        // Conversión para formato europeo
        String inputParseable = input
            .replaceAll(' ', '') // Remover espacios
            .replaceAll('.', '') // Remover separadores de miles
            .replaceAll(',', '.'); // Convertir coma decimal a punto

        numero = double.parse(inputParseable);
      } catch (e) {
        print('Error: "$input" no es un número válido.');
        print('Ejemplos válidos: 12,5 - 1234,56 - 1.234,56');
      }
    } else {
      print('Error: No ingresaste ningún valor. Intenta de nuevo.');
    }
  }

  return numero;
}

// Función para formatear números en formato europeo
String formatearDouble(double numero) {
  final formato = NumberFormat('#,##0.00', 'es_ES');
  return formato.format(numero);
}

// Funciones de validación (las mismas de ejercicios anteriores)
int pedirNumero(String mensaje) {
  int? numero;
  while (numero == null) {
    print(mensaje);
    String? input = stdin.readLineSync();
    if (input != null && input.isNotEmpty) {
      try {
        numero = int.parse(input);
      } catch (e) {
        print('Error: "$input" no es un número válido. Intenta de nuevo.');
      }
    } else {
      print('Error: No ingresaste ningún valor. Intenta de nuevo.');
    }
  }
  return numero;
}

String pedirTexto(String mensaje) {
  String? texto;
  while (texto == null || texto.isEmpty) {
    print(mensaje);
    texto = stdin.readLineSync();
    if (texto == null || texto.isEmpty) {
      print('Error: No ingresaste ningún valor. Intenta de nuevo.');
    }
  }
  return texto;
}

// BLOQUE 1 - FUNCIONES BÁSICAS

// 1. Función sin parámetros ni retorno
void saludar() {
  print('Hola, bienvenido a Dart');
}
// Lógica: Función void simple que solo ejecuta print

// 2. Función que recibe dos números y devuelve su suma
int sumar(int a, int b) {
  return a + b;
}
// Lógica: Función con parámetros y return para operación matemática básica

// 3. Función que determina si un número es par o impar
String esParOImpar(int numero) {
  if (numero % 2 == 0) {
    return 'par';
  } else {
    return 'impar';
  }
}
// Lógica: Uso de módulo % para determinar paridad con retorno condicional

// 4. Función que calcula el área de un rectángulo
double areaRectangulo(double base, double altura) {
  return base * altura;
}
// Lógica: Fórmula matemática básica con parámetros double

// 5. Función que calcula la media de una lista de notas
double calcularMedia(List<double> notas) {
  double suma = 0;
  for (double nota in notas) {
    suma += nota;
  }
  return suma / notas.length;
}
// Lógica: Iteración con for-in y división por longitud para promedio

// 6. Función que cuenta nombres que empiezan por "A"
int contarNombresConA(List<String> nombres) {
  int contador = 0;
  for (String nombre in nombres) {
    if (nombre.startsWith('A')) {
      contador++;
    }
  }
  return contador;
}
// Lógica: Filtrado con startsWith() y contador incremental

// 7. Función que calcula el factorial de un número
int factorial(int n) {
  int resultado = 1;
  for (int i = 1; i <= n; i++) {
    resultado *= i;
  }
  return resultado;
}
// Lógica: Bucle for con multiplicación acumulativa para factorial

// 8. Función que cuenta vocales en una palabra
int contarVocales(String palabra) {
  int vocales = 0;
  for (String letra in palabra.toLowerCase().split('')) {
    if ('aeiou'.contains(letra)) {
      vocales++;
    }
  }
  return vocales;
}
// Lógica: Conversión a minúsculas y comparación con string de vocales

// 9. Funciones de conversión de temperatura
double celsiusAFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

double fahrenheitACelsius(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}
// Lógica: Aplicación de fórmulas de conversión térmica estándar

// 10. Función que verifica divisibilidad
String esDivisible(int a, int b) {
  if (b == 0) {
    return 'No se puede dividir por cero';
  }
  if (a % b == 0) {
    return '$a es divisible por $b';
  } else {
    return '$a no es divisible por $b';
  }
}
// Lógica: Verificación de divisibilidad con módulo y manejo de división por cero

// BLOQUE 2 - RETOS COMBINADOS

// 11. Función que calcula total con IVA
double calcularTotalConIVA(List<double> precios) {
  double total = 0;
  for (double precio in precios) {
    total += precio * 1.21;
  }
  return total;
}
// Lógica: Aplicación de porcentaje IVA a cada elemento y suma acumulativa

// 12. Función que cuenta apariciones de una letra
int contarLetra(String texto, String letra) {
  int contador = 0;
  for (String caracter in texto.toLowerCase().split('')) {
    if (caracter == letra.toLowerCase()) {
      contador++;
    }
  }
  return contador;
}
// Lógica: Búsqueda case-insensitive con división de string en caracteres

// 13. Función que encuentra el mayor de tres números
int encontrarMayor(int a, int b, int c) {
  if (a >= b && a >= c) {
    return a;
  } else if (b >= a && b >= c) {
    return b;
  } else {
    return c;
  }
}
// Lógica: Comparación múltiple con operadores lógicos para determinar máximo

// 14. Función que calcula IMC
double calcularIMC(double peso, double altura) {
  double imc = peso / (altura * altura);
  return imc;
}
// Lógica: Cálculo de IMC y clasificación según rangos médicos estándar

// 15. Función que filtra números pares de una lista
List<int> filtrarPares(List<int> numeros) {
  List<int> pares = [];
  for (int numero in numeros) {
    if (numero % 2 == 0) {
      pares.add(numero);
    }
  }
  return pares;
}
// Lógica: Filtrado con módulo y construcción de nueva lista con add()

// 16. Función que encuentra el string más largo
String encontrarMasLargo(List<String> textos) {
  String masLargo = textos[0];
  for (String texto in textos) {
    if (texto.length > masLargo.length) {
      masLargo = texto;
    }
  }
  return masLargo;
}
// Lógica: Comparación secuencial de longitudes para encontrar máximo

// 17. Función de saludo personalizado
String saludoPersonalizado(String nombre) {
  return '¡Hola $nombre! Es un placer verte por aquí.';
}
// Lógica: Interpolación de strings para mensaje personalizado dinámico

// 18. Función que suma todos los enteros hasta un número
int sumaHastaN(int n) {
  int suma = 0;
  for (int i = 1; i <= n; i++) {
    suma += i;
  }
  return suma;
}
// Lógica: Suma acumulativa con bucle for desde 1 hasta n

// 19. Función que verifica palíndromo
bool esPalindromo(String palabra) {
  String palabraLimpia = palabra.toLowerCase().replaceAll(' ', '');
  String palabraInvertida = palabraLimpia.split('').reversed.join('');
  return palabraLimpia == palabraInvertida;
}
// Lógica: Comparación de string original con versión invertida sin espacios

// 20. Programa principal con menú
void menuPrincipal() {
  print('\n=== MENÚ PRINCIPAL DE FUNCIONES ===');
  print('1. Saludar');
  print('2. Sumar dos números');
  print('3. Verificar par/impar');
  print('4. Calcular área rectángulo');
  print('5. Calcular media de notas');
  print('6. Contar nombres con A');
  print('7. Calcular factorial');
  print('8. Contar vocales');
  print('9. Convertir temperaturas');
  print('10. Verificar divisibilidad');
  print('11. Calcular total con IVA');
  print('12. Contar apariciones de letra');
  print('13. Encontrar mayor de tres números');
  print('14. Calcular IMC');
  print('15. Filtrar números pares');
  print('16. Encontrar string más largo');
  print('17. Saludo personalizado');
  print('18. Sumar hasta N');
  print('19. Verificar palíndromo');
  print('0. Salir');
}
// Lógica: Menú estructurado para acceso organizado a todas las funciones

void main() {
  print('=== EJERCICIOS 9-OCT-2025 - FUNCIONES EN DART ===');

  int opcion;
  do {
    menuPrincipal();
    opcion = pedirNumero('\nElige una opción (0-19):');

    // MENÚ CON IF ELSE
    if (opcion == 1) {
      print('\n--- Ejercicio 1: Saludo ---');
      saludar();
    } else if (opcion == 2) {
      print('\n--- Ejercicio 2: Sumar dos números ---');
      int a = pedirNumero('Ingresa el primer número:');
      int b = pedirNumero('Ingresa el segundo número:');
      int resultado = sumar(a, b);
      print('$a + $b = $resultado');
    } else if (opcion == 3) {
      print('\n--- Ejercicio 3: Verificar par/impar ---');
      int num = pedirNumero('Ingresa un número:');
      String resultadoPar = esParOImpar(num);
      print('El número $num es $resultadoPar');
    } else if (opcion == 4) {
      print('\n--- Ejercicio 4: Área del rectángulo ---');
      double base = pedirDouble('Ingresa la base:');
      double altura = pedirDouble('Ingresa la altura:');
      double area = areaRectangulo(base, altura);
      var areaEU = formatearDouble(area);
      print('Área del rectángulo: $areaEU');
    } else if (opcion == 5) {
      print('\n--- Ejercicio 5: Media de notas ---');
      //aquí lo ideal para adaptarlo a EU sería recorrer la
      List<double> notas = [7.5, 6.0, 8.5, 5.0, 9.0];
      double media = calcularMedia(notas);
      //La imprime en formato EU
      for (double nota in notas) {
        print(formatearDouble(nota));
      }
      var mediaEU = formatearDouble(media);
      print('Media: ${mediaEU}');
    } else if (opcion == 6) {
      print('\n--- Ejercicio 6: Nombres con A ---');
      List<String> nombres = ['Ana', 'Juan', 'Alberto', 'María', 'Antonio'];
      int cantidad = contarNombresConA(nombres);
      print('Nombres: $nombres');
      print('Cantidad que empiezan con A: $cantidad');
    } else if (opcion == 7) {
      print('\n--- Ejercicio 7: Factorial ---');
      int numFact = pedirNumero(
        'Ingresa un número para calcular su factorial:',
      );
      int fact = factorial(numFact);
      print('Factorial de $numFact: $fact');
    } else if (opcion == 8) {
      print('\n--- Ejercicio 8: Contar vocales ---');
      String palabra = pedirTexto('Ingresa una palabra:');
      int vocales = contarVocales(palabra);
      print('La palabra "$palabra" tiene $vocales vocales');
    } else if (opcion == 9) {
      print('\n--- Ejercicio 9: Conversión de temperaturas ---');
      print('1. Celsius a Fahrenheit');
      print('2. Fahrenheit a Celsius');
      int subOpcion = pedirNumero('Elige conversión:');
      if (subOpcion == 1) {
        double celsius = pedirDouble('Ingresa grados Celsius:');
        double fahrenheit = celsiusAFahrenheit(celsius);
        print('$celsius°C = ${formatearDouble(fahrenheit)}°F');
      } else if (subOpcion == 2) {
        double fahrenheit = pedirDouble('Ingresa grados Fahrenheit:');
        double celsius = fahrenheitACelsius(fahrenheit);
        print('$fahrenheit°F = ${formatearDouble(fahrenheit)}°C');
      } else {
        print('Opción no válida');
      }
    } else if (opcion == 10) {
      print('\n--- Ejercicio 10: Verificar divisibilidad ---');
      int num1 = pedirNumero('Ingresa el primer número:');
      int num2 = pedirNumero('Ingresa el segundo número:');
      String resultadoDiv = esDivisible(num1, num2);
      print(resultadoDiv);
    } else if (opcion == 11) {
      print('\n--- Ejercicio 11: Total con IVA ---');
      List<double> precios = [100.0, 50.0, 25.0, 75.0];
      double totalIVA = calcularTotalConIVA(precios);
      //La imprime en formato EU
      for (double precio in precios) {
        print(formatearDouble(precio) + ' €');
      }
      var totalIVAEU = formatearDouble(totalIVA);
      print('Total con IVA (21%): ${totalIVAEU} €');
    } else if (opcion == 12) {
      print('\n--- Ejercicio 12: Contar apariciones de letra ---');
      String texto = pedirTexto('Ingresa un texto:');
      String letra = pedirTexto('Ingresa la letra a buscar:');
      int apariciones = contarLetra(texto, letra);
      print('La letra "$letra" aparece $apariciones veces en el texto');
    } else if (opcion == 13) {
      print('\n--- Ejercicio 13: Mayor de tres números ---');
      int x = pedirNumero('Ingresa el primer número:');
      int y = pedirNumero('Ingresa el segundo número:');
      int z = pedirNumero('Ingresa el tercer número:');
      int mayor = encontrarMayor(x, y, z);
      print('El mayor de $x, $y, $z es: $mayor');
    } else if (opcion == 14) {
      print('\n--- Ejercicio 14: Calcular IMC ---');
      double peso = pedirDouble('Ingresa tu peso en kg:');
      double altura = pedirDouble('Ingresa tu altura en metros:');
      double imc = calcularIMC(peso, altura);
      if (imc < 18.5) {
        print('IMC: ${formatearDouble(imc)} - Bajo peso');
      } else if (imc < 25) {
        print('IMC: ${formatearDouble(imc)} - Medio peso');
      } else if (imc < 30) {
        print('IMC: ${formatearDouble(imc)} - Sobrepeso');
      } else {
        print('IMC: ${formatearDouble(imc)} - Obesidad');
      }
    } else if (opcion == 15) {
      print('\n--- Ejercicio 15: Filtrar números pares ---');
      List<int> numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      List<int> pares = filtrarPares(numeros);
      print('Lista original: $numeros');
      print('Números pares: $pares');
    } else if (opcion == 16) {
      print('\n--- Ejercicio 16: String más largo ---');
      List<String> textos = [
        'Hola',
        'Mundo',
        'Programación',
        'Dart',
        'Flutter',
      ];
      String masLargo = encontrarMasLargo(textos);
      print('Lista: $textos');
      print('Texto más largo: "$masLargo"');
    } else if (opcion == 17) {
      print('\n--- Ejercicio 17: Saludo personalizado ---');
      String nombre = pedirTexto('Ingresa tu nombre:');
      String saludo = saludoPersonalizado(nombre);
      print(saludo);
    } else if (opcion == 18) {
      print('\n--- Ejercicio 18: Sumar hasta N ---');
      int n = pedirNumero('Ingresa un número N:');
      int suma = sumaHastaN(n);
      print('La suma de todos los enteros hasta $n es: $suma');
    } else if (opcion == 19) {
      print('\n--- Ejercicio 19: Verificar palíndromo ---');
      String palabraPal = pedirTexto('Ingresa una palabra:');
      bool esPal = esPalindromo(palabraPal);
      if (esPal) {
        print('"$palabraPal" es un palíndromo');
      } else {
        print('"$palabraPal" no es un palíndromo');
      }
    } else if (opcion == 0) {
      print('¡Hasta luego!');
    } else {
      print('Opción no válida. Intenta de nuevo.');
    }

    if (opcion != 0) {
      print('\nPresiona Enter para continuar...');
      stdin.readLineSync();
    }
  } while (opcion != 0);
}
