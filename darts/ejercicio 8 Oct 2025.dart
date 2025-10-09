import 'dart:io';

// Funciones de validación (las mismas que he utilizado el 7 de octubre)
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

double pedirDouble(String mensaje) {
  double? numero;
  while (numero == null) {
    print(mensaje);
    String? input = stdin.readLineSync();
    if (input != null && input.isNotEmpty) {
      try {
        numero = double.parse(input);
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

void main() {
  print('=== EJERCICIOS 8-OCT-2025 - CONTROLES DE FLUJO EN DART ===');

  // BLOQUE 1: Condicionales (if, else if, switch)

  print('\n--- BLOQUE 1: CONDICIONALES ---');

  // 1. Número mayor o menor que 100
  print('\n1. Número mayor o menor que 100:');
  int numero1 = pedirNumero('Ingresa un número:');
  if (numero1 > 100) {
    print('$numero1 es mayor que 100');
  } else if (numero1 < 100) {
    print('$numero1 es menor que 100');
  } else {
    print('$numero1 es igual a 100');
  }
  // Lógica: Comparación secuencial con if-else if-else para determinar relación con 100

  // 2. Clasificación de edades
  print('\n2. Clasificación de edades:');
  int edad = pedirNumero('Ingresa tu edad:');
  if (edad < 12) {
    print('Niño');
  } else if (edad < 18) {
    print('Adolescente');
  } else {
    print('Adulto');
  }
  // Lógica: Encadenamiento de condiciones con rangos de edad usando else if

  // 3. Día de la semana
  print('\n3. Día de la semana:');
  int diaNumero;
  do {
    diaNumero = pedirNumero('Ingresa un número del 1 al 7:');
    if (diaNumero < 1 || diaNumero > 7) {
      print('Error: El número debe estar entre 1 y 7. Intenta de nuevo.');
    }
  } while (diaNumero < 1 || diaNumero > 7);

  switch (diaNumero) {
    case 1:
      print('Lunes');
      break;
    case 2:
      print('Martes');
      break;
    case 3:
      print('Miércoles');
      break;
    case 4:
      print('Jueves');
      break;
    case 5:
      print('Viernes');
      break;
    case 6:
      print('Sábado');
      break;
    case 7:
      print('Domingo');
      break;
  }
  // Lógica: Switch case para convertir números a días con validación de rango en caso se ponga un número más alto de 7

  // 4. Nota final del alumno
  print('\n4. Nota final del alumno:');
  double nota;
  do {
    nota = pedirDouble('Ingresa una nota (0-10):');
    if (nota < 0 || nota > 10) {
      print('Error: La nota debe estar entre 0 y 10. Intenta de nuevo.');
    }
  } while (nota < 0 || nota > 10);

  if (nota >= 0 && nota <= 4) {
    print('Suspenso');
  } else if (nota >= 5 && nota <= 6) {
    print('Aprobado');
  } else if (nota >= 7 && nota <= 8) {
    print('Notable');
  } else {
    print('Sobresaliente');
  }
  // Lógica: Condiciones con rangos numéricos para clasificar notas académicas con máximo y mínimo

  // 5. Menú de operaciones
  print('\n5. Menú de operaciones:');
  print('1. Sumar');
  print('2. Restar');
  print('3. Multiplicar');
  print('4. Dividir');

  int opcion;
  do {
    opcion = pedirNumero('Elige una opción (1-4):');
    if (opcion < 1 || opcion > 4) {
      print('Error: Opción no válida. Intenta de nuevo.');
    }
  } while (opcion < 1 || opcion > 4);

  double num1 = pedirDouble('Ingresa el primer número:');
  double num2 = pedirDouble('Ingresa el segundo número:');
  double resultado;

  switch (opcion) {
    case 1:
      resultado = num1 + num2;
      print('$num1 + $num2 = $resultado');
      break;
    case 2:
      resultado = num1 - num2;
      print('$num1 - $num2 = $resultado');
      break;
    case 3:
      resultado = num1 * num2;
      print('$num1 * $num2 = $resultado');
      break;
    case 4:
      if (num2 != 0) {
        resultado = num1 / num2;
        print('$num1 / $num2 = $resultado');
      } else {
        print('Error: No se puede dividir entre cero');
      }
      break;
  }
  // Lógica: Switch para ejecutar operaciones matemáticas según selección de menú

  // BLOQUE 2: Bucles (for, for-in, while, do-while)

  print('\n--- BLOQUE 2: BUCLES ---');

  // 6. Contar del 1 al 10
  print('\n6. Contar del 1 al 10:');
  for (int i = 1; i <= 10; i++) {
    print(i);
  }
  // Lógica: Bucle for con incremento para secuencia numérica ascendente

  // 7. Suma de números pares
  print('\n7. Suma de números pares del 1 al 50:');
  int sumaPares = 0;
  for (int i = 1; i <= 50; i++) {
    if (i % 2 == 0) {
      sumaPares += i;
    }
  }
  print('La suma de los números pares del 1 al 50 es: $sumaPares');
  // Lógica: For con filtro de pares usando módulo y acumulador de suma

  // 8. Tabla de multiplicar
  print('\n8. Tabla de multiplicar:');
  int numeroTabla = pedirNumero(
    'Ingresa un número para ver su tabla de multiplicar:',
  );
  for (int i = 1; i <= 10; i++) {
    print('$numeroTabla x $i = ${numeroTabla * i}');
  }
  // Lógica: Iteración for para generar tabla de multiplicar con formato

  // 9. Recorrer lista de frutas
  print('\n9. Recorrer lista de frutas:');
  List<String> frutas = ['Manzana', 'Banana', 'Naranja', 'Uva', 'Pera'];
  for (String fruta in frutas) {
    print(fruta);
  }
  // Lógica: For-in para iteración simplificada sobre elementos de lista

  // 10. Buscar elemento en lista
  print('\n10. Buscar elemento en lista:');
  List<String> nombres = ['Ana', 'Juan', 'María', 'Carlos', 'Laura'];
  print('Lista actual: $nombres');
  String nombreBuscado = pedirTexto('Ingresa un nombre para buscar:');

  bool encontrado = false;
  for (String nombre in nombres) {
    if (nombre.toLowerCase() == nombreBuscado.toLowerCase()) {
      encontrado = true;
      break;
    }
  }

  if (encontrado) {
    print('¡El nombre "$nombreBuscado" está en la lista!');
  } else {
    print('El nombre "$nombreBuscado" no está en la lista.');
  }
  // Lógica: Búsqueda lineal con for-in y comparación case-insensitive

  // 11. Contador hasta número ingresado
  print('\n11. Contador hasta número ingresado:');
  int n = pedirNumero('Ingresa un número para la cuenta regresiva:');
  for (int i = n; i >= 1; i--) {
    print(i);
  }
  // Lógica: For descendente desde n hasta 1 para cuenta regresiva

  // 12. Suma de entradas del usuario
  print('\n12. Suma de entradas del usuario:');
  int sumaTotal = 0;
  for (int i = 1; i <= 5; i++) {
    int numero = pedirNumero('Ingresa el número $i:');
    sumaTotal += numero;
  }
  print('La suma de los 5 números es: $sumaTotal');
  // Lógica: For con acumulador para sumar múltiples entradas del usuario

  // 13. Adivina el número secreto
  print('\n13. Adivina el número secreto:');
  int numeroSecreto = 7;
  int intento;
  print('Adivina el número secreto (entre 1 y 10)');

  do {
    intento = pedirNumero('Tu intento:');
    if (intento != numeroSecreto) {
      print('¡Incorrecto! Intenta de nuevo.');
    }
  } while (intento != numeroSecreto);

  print('¡Correcto! El número secreto era $numeroSecreto');
  // Lógica: While con condición de desigualdad para juego de adivinar el número

  // 14. Contador de intentos
  print('\n14. Contador de intentos:');
  numeroSecreto = 7;
  int contadorIntentos = 0;
  print('Adivina el número secreto (entre 1 y 10)');

  do {
    intento = pedirNumero('Tu intento:');
    contadorIntentos++;
    if (intento != numeroSecreto) {
      print('¡Incorrecto! Intenta de nuevo.');
    }
  } while (intento != numeroSecreto);

  print('¡Correcto! Adivinaste en $contadorIntentos intento(s)');
  // Lógica: Contador incremental dentro de bucle para medir rendimiento

  // 15. Confirmación de salida
  print('\n15. Confirmación de salida:');
  String respuesta;
  do {
    respuesta = pedirTexto('¿Deseas continuar? (s/n):').toLowerCase();
  } while (respuesta != 'n');

  print('¡Hasta luego!');
  // Lógica: Do-while para ejecución mínima una vez hasta condición de salida
}
