import 'dart:io';

/*Función para pedir número entero hasta que sea válido
  como la entrada puede ser un alfanumérico y crashea el programa hay que comprobar cada tipo de dato en las siguientes
  funciones*/

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

// Función para pedir número decimal hasta que sea válido
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

// Función para pedir texto hasta que no esté vacío
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

// Función para pedir una sola letra
String pedirLetra(String mensaje) {
  String? letra;
  while (letra == null || letra.isEmpty || letra.length > 1) {
    print(mensaje);
    letra = stdin.readLineSync();
    if (letra == null || letra.isEmpty) {
      print('Error: No ingresaste ningún valor. Intenta de nuevo.');
    } else if (letra.length > 1) {
      print('Error: Debes ingresar solo una letra. Intenta de nuevo.');
      letra = null;
    }
  }
  return letra.toLowerCase();
}

void main() {
  // BLOQUE 1 - Condicionales if / else

  print('=== BLOQUE 1 - CONDICIONALES ===');

  // 1. Comprueba si un número es positivo o negativo.
  print('\n1. Comprobar si un número es positivo o negativo:');
  int num = pedirNumero('Ingresa un número:');
  if (num >= 0) {
    print('$num es positivo');
  } else {
    print('$num es negativo');
  }

  // 2. Pide un número y di si es par o impar.
  print('\n2. Verificar si es par o impar:');
  int numero = pedirNumero('Ingresa un número:');
  if (numero % 2 == 0) {
    print('$numero es par');
  } else {
    print('$numero es impar');
  }

  // 3. Pide la edad de una persona y muestra si es mayor de edad o no.
  print('\n3. Verificar si es mayor de edad:');
  int edad = pedirNumero('Ingresa tu edad:');
  if (edad >= 18) {
    print('Con $edad años es mayor de edad');
  } else {
    print('Con $edad años es menor de edad');
  }

  // 4. Pide un número y muestra si está entre 10 y 50.
  print('\n4. Verificar si está entre 10 y 50:');
  int num4 = pedirNumero('Ingresa un número:');
  if (num4 >= 10 && num4 <= 50) {
    print('$num4 está entre 10 y 50');
  } else {
    print('$num4 NO está entre 10 y 50');
  }

  // 5. Pide una contraseña y valida si es igual a "1234".
  print('\n5. Validar contraseña:');
  String clave = pedirTexto('Ingresa la contraseña:');
  if (clave == "1234") {
    print('Contraseña correcta');
  } else {
    print('Contraseña incorrecta');
  }

  // 6. Compara dos números e indica cuál es mayor.
  print('\n6. Comparar dos números:');
  int a = pedirNumero('Ingresa el primer número:');
  int b = pedirNumero('Ingresa el segundo número:');
  if (a > b) {
    print('$a es mayor que $b');
  } else if (a < b) {
    print('$a es menor que $b');
  } else {
    print('$a es igual a $b');
  }

  // 7. Pide una nota (0-10) y muestra si el alumno aprueba o suspende.
  print('\n7. Verificar si aprueba:');
  double nota = pedirDouble('Ingresa la nota (0-10):');
  if (nota >= 5) {
    print('Nota $nota - Aprobado');
  } else {
    print('Nota $nota - Suspendido');
  }

  // 8. Pide una letra y muestra si es vocal o consonante.
  print('\n8. Verificar si es vocal o consonante:');
  String letra = pedirLetra('Ingresa una letra:');
  if (letra == "a" ||
      letra == "e" ||
      letra == "i" ||
      letra == "o" ||
      letra == "u") {
    print('$letra es una vocal');
  } else {
    print('$letra es una consonante');
  }

  // 9. Pide un número y muestra si es múltiplo de 3 y de 5 al mismo tiempo.
  print('\n9. Verificar múltiplo de 3 y 5:');
  int num9 = pedirNumero('Ingresa un número:');
  if (num9 % 3 == 0 && num9 % 5 == 0) {
    print('$num9 es múltiplo de 3 y de 5');
  } else {
    print('$num9 NO es múltiplo de 3 y de 5');
  }

  // 10. Pide un número y muestra si es igual, menor o mayor que 100.
  print('\n10. Comparar con 100:');
  int num10 = pedirNumero('Ingresa un número:');
  if (num10 == 100) {
    print('$num10 es igual a 100');
  } else if (num10 < 100) {
    print('$num10 es menor que 100');
  } else {
    print('$num10 es mayor que 100');
  }

  // BLOQUE 2 - Bucles for

  print('\n\n=== BLOQUE 2 - BUCLES FOR ===');

  // 1. Muestra los números del 1 al 10.
  print('\n1. Números del 1 al 10:');
  for (int i = 1; i <= 10; i++) {
    print(i);
  }

  // 2. Muestra los números pares entre 1 y 20.
  print('\n2. Números pares entre 1 y 20:');
  for (int i = 1; i <= 20; i++) {
    if (i % 2 == 0) {
      print(i);
    }
  }

  // 3. Muestra la tabla de multiplicar de un número introducido.
  print('\n3. Tabla de multiplicar:');
  int numeroTabla = pedirNumero(
    'Ingresa un número para la tabla de multiplicar:',
  );
  for (int i = 1; i <= 10; i++) {
    print('$numeroTabla x $i = ${numeroTabla * i}');
  }

  // 4. Suma todos los números del 1 al 100.
  print('\n4. Suma del 1 al 100:');
  int suma = 0;
  for (int i = 1; i <= 100; i++) {
    suma += i;
  }
  print('La suma es: $suma');

  // 5. Muestra los múltiplos de 3 hasta el 30.
  print('\n5. Múltiplos de 3 hasta 30:');
  for (int i = 3; i <= 30; i += 3) {
    print(i);
  }

  // 6. Cuenta cuántos números entre 1 y 50 son divisibles por 7.
  print('\n6. Números divisibles por 7 entre 1-50:');
  int contador = 0;
  for (int i = 1; i <= 50; i++) {
    if (i % 7 == 0) {
      contador++;
    }
  }
  print('Hay $contador números divisibles por 7');

  // 7. Calcula el factorial de un número.
  print('\n7. Factorial de un número:');
  int numeroFactorial = pedirNumero(
    'Ingresa un número para calcular su factorial:',
  );
  int factorial = 1;
  for (int i = 1; i <= numeroFactorial; i++) {
    factorial *= i;
  }
  print('Factorial de $numeroFactorial es: $factorial');

  // 8. Muestra los números del 10 al 1 en orden descendente.
  print('\n8. Números del 10 al 1 descendente:');
  for (int i = 10; i >= 1; i--) {
    print(i);
  }

  // 9. Pide un número y muestra su cuenta atrás hasta 0.
  print('\n9. Cuenta atrás desde un número:');
  int numeroCuenta = pedirNumero('Ingresa un número para la cuenta atrás:');
  for (int i = numeroCuenta; i >= 0; i--) {
    print(i);
  }

  // 10. Calcula la suma de los números pares del 1 al 50.
  print('\n10. Suma de pares del 1 al 50:');
  int sumaPares = 0;
  for (int i = 1; i <= 50; i++) {
    if (i % 2 == 0) {
      sumaPares += i;
    }
  }
  print('Suma de pares: $sumaPares');

  // BLOQUE 3 - Bucles for-in con listas

  print('\n\n=== BLOQUE 3 - BUCLES FOR-IN CON LISTAS ===');

  // 1. Declara una lista de nombres e imprime cada uno.
  print('\n1. Lista de nombres:');
  List<String> nombres = ['Ana', 'Juan', 'María', 'Carlos'];
  for (var nombre in nombres) {
    print(nombre);
  }

  // 2. Crea una lista de números y muestra solo los mayores de 10.
  print('\n2. Números mayores de 10:');
  List<int> numeros = [5, 12, 8, 25, 3, 18];
  for (var numero in numeros) {
    if (numero > 10) {
      print(numero);
    }
  }

  // 3. Suma todos los valores de una lista de enteros.
  print('\n3. Suma de valores de lista:');
  List<int> numerosSuma = [1, 2, 3, 4, 5];
  int sumaLista = 0;
  for (var numero in numerosSuma) {
    sumaLista += numero;
  }
  print('Suma: $sumaLista');

  // 4. Busca si una lista contiene el número 7 y muestra un mensaje si lo encuentra.
  print('\n4. Buscar el número 7:');
  List<int> numerosBuscar = [1, 2, 3, 7, 8, 9];
  bool encontrado = false;
  for (var numero in numerosBuscar) {
    if (numero == 7) {
      encontrado = true;
      print('¡Número 7 encontrado!');
      break;
    }
  }
  if (!encontrado) {
    print('Número 7 no encontrado');
  }

  // 5. Crea una lista con nombres y muestra solo los que empiecen por "A".
  print('\n5. Nombres que empiezan por A:');
  List<String> nombresA = ['Ana', 'Juan', 'Alberto', 'María', 'Antonio'];
  for (var nombre in nombresA) {
    if (nombre.startsWith("A")) {
      print(nombre);
    }
  }

  // 6. Crea una lista con notas y muestra cuáles están aprobadas (≥5).
  print('\n6. Notas aprobadas:');
  List<double> notasLista = [4.5, 6.0, 3.2, 8.5, 7.0, 5.5];
  for (var nota in notasLista) {
    if (nota >= 5) {
      print('Nota $nota: Aprobado');
    }
  }

  // 7. Cuenta cuántos nombres tienen más de 4 letras.
  print('\n7. Nombres con más de 4 letras:');
  List<String> nombresLargos = ['Ana', 'Juan', 'María', 'Carlos', 'Luisa'];
  int contadorNombres = 0;
  for (var nombre in nombresLargos) {
    if (nombre.length > 4) {
      contadorNombres++;
    }
  }
  print('Hay $contadorNombres nombres con más de 4 letras');

  // 8. Crea una lista de precios y calcula el total.
  print('\n8. Total de precios:');
  List<double> precios = [10.5, 25.0, 8.75, 15.25];
  double total = 0;
  for (var precio in precios) {
    total += precio;
  }
  print('Total: \$${total.toStringAsFixed(2)}');

  // 9. Convierte una lista de strings a mayúsculas e imprímela.
  print('\n9. Lista en mayúsculas:');
  List<String> palabras = ['hola', 'mundo', 'dart'];
  for (var palabra in palabras) {
    print(palabra.toUpperCase());
  }

  // 10. Crea una lista con edades y muestra cuántas personas son mayores de edad.
  print('\n10. Mayores de edad:');
  List<int> edades = [15, 25, 17, 30, 16, 22];
  int contadorEdades = 0;
  for (var edad in edades) {
    if (edad >= 18) {
      contadorEdades++;
    }
  }
  print('Hay $contadorEdades personas mayores de edad');

  // BLOQUE 4 - Retos combinados

  print('\n\n=== BLOQUE 4 - RETOS COMBINADOS ===');

  // 1. Pide 5 números al usuario, guárdalos en una lista y muestra su suma total.
  print('\n1. Suma de 5 números:');
  List<int> numeros5 = [];
  for (int i = 1; i <= 5; i++) {
    int num = pedirNumero('Ingresa el número $i:');
    numeros5.add(num);
  }
  int suma5 = 0;
  for (var numero in numeros5) {
    suma5 += numero;
  }
  print('Números ingresados: $numeros5');
  print('Suma total: $suma5');

  // 2. Pide un número y muestra su tabla de multiplicar, pero solo de los pares.
  print('\n2. Tabla de multiplicar solo pares:');
  int numeroTablaPares = pedirNumero('Ingresa un número:');
  for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
      print('$numeroTablaPares x $i = ${numeroTablaPares * i}');
    }
  }

  // 3. Crea una lista de nombres y muestra cuántos contienen la letra "e".
  print('\n3. Nombres con letra "e":');
  List<String> nombresE = ['Ana', 'Pedro', 'Elena', 'Carlos', 'Eva'];
  int contadorE = 0;
  for (var nombre in nombresE) {
    if (nombre.toLowerCase().contains("e")) {
      contadorE++;
    }
  }
  print('Total de nombres con "e": $contadorE');

  // 4. Pide una palabra y muestra cada letra por línea.
  print('\n4. Letras de una palabra:');
  String palabra = pedirTexto('Ingresa una palabra:');
  List<String> letras = palabra.split("");
  for (var letra in letras) {
    print(letra);
  }

  // 5. Pide un número y muestra la suma de todos los impares hasta ese número.
  print('\n5. Suma de impares hasta un número:');
  int limite = pedirNumero('Ingresa un número límite:');
  int sumaImpares = 0;
  for (int i = 1; i <= limite; i++) {
    if (i % 2 != 0) {
      sumaImpares += i;
    }
  }
  print('Suma de impares hasta $limite: $sumaImpares');

  // 6. Crea una lista con 5 notas y muestra el promedio y si aprueba.
  print('\n6. Promedio de notas:');
  List<double> notas5 = [7.5, 6.0, 8.5, 5.0, 9.0];
  double sumaNotas = 0;
  for (var nota in notas5) {
    sumaNotas += nota;
  }
  double promedio = sumaNotas / notas5.length;
  print('Notas: $notas5');
  print('Promedio: ${promedio.toStringAsFixed(2)}');
  print(promedio >= 5 ? 'APROBADO' : 'SUSPENDIDO');

  // 7. Crea una lista con 10 números y muestra cuántos son pares y cuántos impares.
  print('\n7. Contar pares e impares:');
  List<int> numeros10 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int pares = 0, impares = 0;
  for (var numero in numeros10) {
    if (numero % 2 == 0) {
      pares++;
    } else {
      impares++;
    }
  }
  print('Números: $numeros10');
  print('Pares: $pares, Impares: $impares');

  // 8. Pide una frase y cuenta cuántas vocales tiene.
  print('\n8. Contar vocales en frase:');
  String frase = pedirTexto('Ingresa una frase:');
  int vocales = 0;
  for (var letra in frase.toLowerCase().split('')) {
    if ('aeiou'.contains(letra)) {
      vocales++;
    }
  }
  print('Frase: "$frase"');
  print('Número de vocales: $vocales');

  // 9. Crea una lista de precios y muestra el total con IVA incluido (21%).
  print('\n9. Total con IVA:');
  List<double> preciosIVA = [100.0, 50.0, 25.0, 75.0];
  double totalIVA = 0;
  for (var precio in preciosIVA) {
    totalIVA += precio * 1.21;
  }
  print('Precios: $preciosIVA');
  print('Total con IVA (21%): \$${totalIVA.toStringAsFixed(2)}');

  // 10. Pide 3 números y muestra cuál es el mayor.
  print('\n10. Mayor de 3 números:');
  List<int> numeros3 = [];
  for (int i = 1; i <= 3; i++) {
    int num = pedirNumero('Ingresa el número $i:');
    numeros3.add(num);
  }

  int a3 = numeros3[0], b3 = numeros3[1], c3 = numeros3[2];
  int mayor;

  if (a3 >= b3 && a3 >= c3) {
    mayor = a3;
  } else if (b3 >= a3 && b3 >= c3) {
    mayor = b3;
  } else {
    mayor = c3;
  }

  print('Números ingresados: $a3, $b3, $c3');
  print('El mayor es: $mayor');

  print('\n=== TODOS LOS EJERCICIOS COMPLETADOS ===');
}
