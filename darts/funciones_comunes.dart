import 'dart:io';
import 'package:intl/intl.dart';

// Funciones de validación para entrada de usuario
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
    print('(Formato europeo: ej: 1234,56 o 1.234,56)');
    String? input = stdin.readLineSync();
    if (input != null && input.isNotEmpty) {
      try {
        String inputParseable = input
            .replaceAll(' ', '')
            .replaceAll('.', '')
            .replaceAll(',', '.');
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

// Funciones de formateo
String formatearDouble(double numero) {
  final formato = NumberFormat('#,##0.00', 'es_ES');
  return formato.format(numero);
}

String formatearNumero(double numero) {
  return NumberFormat('#,##0.00', 'es_ES').format(numero);
}
