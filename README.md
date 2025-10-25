# Ejercicios de Dart - Octubre 2025

**Curso:** Flutter en CIFO La Violeta  
**Alumno:** David Port  
**Profesor:** Chema  

Este repositorio contiene una colección completa de ejercicios en Dart organizados por días, diseñados para practicar desde conceptos básicos hasta programación asíncrona y manejo de errores.

## 📅 Ejercicios Disponibles

- **7 de Octubre:** Fundamentos - Condicionales, Bucles y Listas
- **8 de Octubre:** Controles de Flujo - Condicionales Avanzados y Bucles  
- **9 de Octubre:** Funciones - Modularización y Reutilización
- **10 de Octubre:** Funciones Avanzadas - Async/Await y Manejo de Errores
- **20-23 de Octubre:** APIs REST - Peticiones HTTP, Modelado de Datos y JSON

## 🚀 Cómo Ejecutar

### Requisitos:
- Dart SDK instalado
- Editor de código (VS Code recomendado)

### Ejecución:
```bash
# Instalar dependencias
dart pub get

# Instalar dependencias
# Ejecutar ejercicios (usar comillas por los espacios)
dart "ejercicios antes de rest/ejercicio 7 oct.dart"
# ... y así para los demás ejercicios de fundamentos

# Alternativa en sistemas Unix/Linux/Mac:
dart ejercicios\ antes\ de\ rest/ejercicio\ 7\ oct.dart
# ... y así para los demás ejercicios de fundamentos

dart "ejercicios rest/ejercicio 21 Oct A.dart"
# ... y así para los demás ejercicios de REST

## 🛠️ Características Técnicas

### Módulo de Funciones Comunes:
- Validación robusta de entradas numéricas y de texto
- Soporte para formato decimal europeo (coma como separador)
- Funciones de formateo profesional de números
- Reutilización de código entre todos los ejercicios

### Manejo de Errores:
- Validación en tiempo de ejecución
- Mensajes de error descriptivos
- Recuperación graceful de fallos
- Excepciones específicas por tipo de error

### Programación Asíncrona:
- Simulación de operaciones de larga duración
- Coordinación de múltiples tareas async

### Consumo de APIs REST:
- Peticiones HTTP a endpoints públicos (`reqres.in`, `restcountries.com`).
- Modelado de datos desde JSON con constructores `factory .fromJson()`.
- Creación de una clase de servicio (`ReqResService`) para encapsular la lógica de la API.
- Manejo de respuestas paginadas con un modelo genérico `ApiResponse<T>`.
- Parseo de estructuras JSON complejas y anidadas.


**¡Proyecto de aprendizaje completo de Dart para el curso de Flutter!** 🎯