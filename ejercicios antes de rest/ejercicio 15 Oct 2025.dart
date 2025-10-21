// =============================================
// BLOQUE 1: Jerarquía Animal
// =============================================

// 1. Clase base Animal
class Animal {
  String nombre;
  int _edad = 0; // Campo privado para el ejercicio 6

  Animal(this.nombre);

  void mover() {
    print("El animal se mueve");
  }

  // Getter y setter para edad (ejercicio 6)
  int get edad => _edad;
  set edad(int e) {
    if (e >= 0) _edad = e;
  }
}
// Lógica: Clase base con constructor, método básico y encapsulación con campo privado

// 2. Subclases Mammal, Bird y Fish
class Mammal extends Animal {
  Mammal(super.nombre);

  @override
  void mover() => print("Soy un $nombre que camina sobre la tierra");
}
// Lógica: Herencia simple con redefinición de método usando override

class Bird extends Animal {
  Bird(super.nombre);

  @override
  void mover() => print("Soy un $nombre que vuela por el aire");
}
// Lógica: Sobrescritura de método para comportamiento específico de ave

class Fish extends Animal {
  Fish(super.nombre);

  @override
  void mover() => print("Soy un $nombre que nada en el agua");
}
// Lógica: Especialización de comportamiento mediante herencia

// 3. Constructores con super() - Ya implementado en las clases anteriores
// Lógica: Uso de super() en constructores para inicialización de clase padre

// 4. Mixins para comportamientos
mixin Walk {
  void caminar() => print(
      "${this is Animal ? (this as Animal).nombre : 'Este ser'} está caminando");
}
// Lógica: Mixin para agregar comportamiento de caminar reusable

mixin Swim {
  void nadar() => print(
      "${this is Animal ? (this as Animal).nombre : 'Este ser'} está nadando");
}
// Lógica: Mixin para comportamiento de natación independiente

mixin Fly {
  void volar() => print(
      "${this is Animal ? (this as Animal).nombre : 'Este ser'} está volando");
}
// Lógica: Mixin para capacidad de vuelo modular

// Clases que combinan herencia y mixins
class Bat extends Mammal with Walk, Fly {
  Bat(super.nombre);
}
// Lógica: Combinación de herencia con múltiples mixins para capacidades extendidas

class Dolphin extends Mammal with Swim {
  Dolphin(super.nombre);
}
// Lógica: Herencia simple con un mixin específico para comportamiento acuático

// 5. Comportamientos múltiples
class Duck extends Bird with Walk, Swim, Fly {
  Duck(super.nombre);
}
// Lógica: Combinación máxima de mixins para objeto con múltiples capacidades

// 6. Encapsulación - Ya implementada en clase Animal (campo _edad)
// Lógica: Uso de campo privado _edad con getter/setter para control de acceso

// 7. Polimorfismo
class Cat extends Mammal with Walk {
  Cat(super.nombre);
}
// Lógica: Clase concreta para demostración de polimorfismo

class Shark extends Fish with Swim {
  Shark(super.nombre);
}
// Lógica: Especialización de pez con capacidad de natación

// 8. Sobrescritura de toString()
class FlyingFish extends Fish with Swim, Fly {
  FlyingFish(super.nombre);

  @override
  String toString() => "Soy un $nombre que puede nadar y volar";
}
// Lógica: Redefinición de toString para descripción personalizada del objeto

// 9. Clase abstracta Animal (versión abstracta)
abstract class AnimalAbstracto {
  String nombre;
  AnimalAbstracto(this.nombre);

  void mover(); // Método abstracto sin implementación
}
// Lógica: Clase abstracta que define interfaz sin implementación concreta

// 10. Ejercicio integrador - Zoológico
void ejercicioIntegradorZoologico() {
  print('\n--- ZOOLÓGICO VIRTUAL ---');

  // Crear instancias de diferentes animales
  List<Animal> animales = [
    Cat('Whiskers'),
    Dolphin('Flipper'),
    Duck('Donald'),
    Bat('Bruce'),
    Shark('Jaws'),
    FlyingFish('Nemo Volador')
  ];

  // Mostrar capacidades de cada animal
  for (var animal in animales) {
    print('\n--- $animal ---');
    animal.mover();

    // Verificar capacidades usando mixins
    if (animal is Cat) animal.caminar();
    if (animal is Dolphin) animal.nadar();
    if (animal is Duck) animal.volar();

    // Mostrar descripción si tiene toString sobreescrito
    if (animal is FlyingFish) print(animal.toString());
  }
}
// Lógica: Demostración completa de POO con polimorfismo, mixins y verificación de tipos

// =============================================
// BLOQUE 2: Ejemplos alternativos
// =============================================

// 1. Clase base con constructor y atributos
class AnimalAlternativo {
  String nombre;
  String tipo;

  AnimalAlternativo(this.nombre, this.tipo);

  void descripcion() {
    print('$nombre es un animal de tipo $tipo');
  }
}
// Lógica: Clase simple con constructor y método de descripción básica

// 2. Subclases con comportamiento específico
class Perro extends AnimalAlternativo {
  String raza;

  Perro(String nombre, this.raza) : super(nombre, 'mamífero');

  @override
  void descripcion() {
    print('$nombre es un perro de raza $raza');
  }
}
// Lógica: Herencia con atributo adicional y sobrescritura de método

// 3. Uso de getters y setters
class Ave {
  double _alturaVuelo = 0;

  double get alturaVuelo => _alturaVuelo;
  set alturaVuelo(double valor) {
    if (valor >= 0) _alturaVuelo = valor;
  }
}
// Lógica: Encapsulación estricta con validación en setter

// 4. Herencia + método extra
class Pez extends Animal {
  Pez(super.nombre);

  void nadar() => print("$nombre está nadando.");
}
// Lógica: Herencia con método adicional específico de la subclase

// 5. Constructores nombrados
class Gato {
  String nombre;
  int edad;

  Gato(this.nombre, this.edad);

  Gato.bebe(this.nombre) : edad = 0;
}
// Lógica: Múltiples constructores para diferentes casos de inicialización

// 6. Clase abstracta y herencia
abstract class Vehiculo {
  void mover();
}
// Lógica: Definición de interfaz abstracta sin implementación

class Coche extends Vehiculo {
  @override
  void mover() => print("El coche se desplaza por la carretera");
}
// Lógica: Implementación concreta de método abstracto

class Avion extends Vehiculo {
  @override
  void mover() => print("El avión vuela por el cielo");
}
// Lógica: Otra implementación con comportamiento específico diferente

// 7. Polimorfismo
void demostrarPolimorfismo() {
  List<Vehiculo> vehiculos = [Coche(), Avion()];

  for (var vehiculo in vehiculos) {
    vehiculo.mover();
  }
}
// Lógica: Uso de polimorfismo para tratar objetos diferentes de manera uniforme

// 8. Composición (objeto dentro de otro)
class Corazon {
  void latir() => print("❤️ Latido...");
}
// Lógica: Clase componente con funcionalidad específica

class Persona {
  Corazon corazon = Corazon();

  void vivir() => corazon.latir();
}
// Lógica: Composición - Persona contiene un Corazon y delega funcionalidad

// 9. Mixins alternativos
mixin Caminar {
  void caminar() => print("Caminando...");
}

mixin Volar {
  void volar() => print("Volando...");
}

mixin Nadar {
  void nadar() => print("Nadando...");
}

class Pinguino with Caminar, Nadar {}
// Lógica: Combinación específica de mixins para pingüino

class Murcielago with Caminar, Volar {}
// Lógica: Otra combinación de mixins para murciélago

class Pato with Caminar, Volar, Nadar {}
// Lógica: Combinación completa de tres mixins para pato

// 10. Ejercicio integrador - Zoológico alternativo
abstract class AnimalZoologico {
  String nombre;
  AnimalZoologico(this.nombre);
  void mover();
}

class Mamifero extends AnimalZoologico {
  Mamifero(String nombre) : super(nombre);
  @override
  void mover() => print("$nombre se mueve como mamífero");
}

class AveZoologico extends AnimalZoologico {
  AveZoologico(String nombre) : super(nombre);
  @override
  void mover() => print("$nombre se mueve como ave");
}

class PezZoologico extends AnimalZoologico {
  PezZoologico(String nombre) : super(nombre);
  @override
  void mover() => print("$nombre se mueve como pez");
}

class GatoZoologico extends Mamifero with Caminar {
  GatoZoologico(String nombre) : super(nombre);
}

class DelfinZoologico extends Mamifero with Nadar {
  DelfinZoologico(String nombre) : super(nombre);
}

class PatoZoologico extends AveZoologico with Caminar, Volar, Nadar {
  PatoZoologico(String nombre) : super(nombre);
}

class TiburonZoologico extends PezZoologico with Nadar {
  TiburonZoologico(String nombre) : super(nombre);
}

void ejercicioIntegradorCompleto() {
  print('\n--- ZOOLÓGICO COMPLETO ---');

  List<AnimalZoologico> animales = [
    GatoZoologico('Bigotes'),
    DelfinZoologico('Flipper'),
    PatoZoologico('Lucas'),
    TiburonZoologico('Tiburóncin')
  ];

  for (var animal in animales) {
    print('\n🔹 ${animal.nombre}:');
    animal.mover();

    if (animal is GatoZoologico) {
      animal.caminar();
      print("✅ ${animal.nombre} puede caminar");
    }
    if (animal is PatoZoologico) {
      animal.volar();
      print("✅ ${animal.nombre} puede volar");
    }
    if (animal is DelfinZoologico) {
      animal.nadar();
      print("✅ ${animal.nombre} puede nadar");
    }
  }
}

// =============================================
// FUNCIÓN PRINCIPAL
// =============================================

void main() {
  print('=== EJERCICIOS 15-OCT-2025 - PROGRAMACIÓN ORIENTADA A OBJETOS ===');

  // Bloque 1: Jerarquía Animal
  print('\n--- BLOQUE 1: JERARQUÍA ANIMAL ---');

  // Ejercicio 3: Crear instancias y probar movimiento
  Bird pajaro = Bird('Gorrión');
  Fish pez = Fish('Salmón');
  pajaro.mover();
  pez.mover();

  // Ejercicio 5: Pato con múltiples comportamientos
  Duck pato = Duck('Pato Lucas');
  print('\n--- Pato con múltiples comportamientos ---');
  pato.mover();
  pato.caminar();
  pato.nadar();
  pato.volar();

  // Ejercicio 6: Encapsulación
  Animal animal = Animal('Genérico');
  animal.edad = 5;
  print('Edad del animal: ${animal.edad}');
  animal.edad = -3; // No debería cambiar
  print('Edad después de intentar asignar -3: ${animal.edad}');

  // Ejercicio 10: Ejercicio integrador
  ejercicioIntegradorZoologico();

  // Bloque 2: Ejemplos alternativos
  print('\n--- BLOQUE 2: EJEMPLOS ALTERNATIVOS ---');

  // Ejercicio 2: Perro con descripción
  Perro perro = Perro('Rex', 'Labrador');
  perro.descripcion();

  // Ejercicio 4: Pez con método adicional
  Pez pezAlternativo = Pez('Nemo');
  pezAlternativo.nadar();

  // Ejercicio 5: Constructores nombrados
  Gato gatoAdulto = Gato('Mimi', 3);
  Gato gatoBebe = Gato.bebe('Kitty');
  print('Gato adulto: ${gatoAdulto.nombre}, ${gatoAdulto.edad} años');
  print('Gato bebé: ${gatoBebe.nombre}, ${gatoBebe.edad} años');

  // Ejercicio 7: Polimorfismo con vehículos
  print('\n--- Polimorfismo con vehículos ---');
  demostrarPolimorfismo();

  // Ejercicio 8: Composición
  print('\n--- Composición ---');
  Persona persona = Persona();
  persona.vivir();

  // Ejercicio 9: Mixins alternativos
  print('\n--- Mixins alternativos ---');
  Pato patoAlternativo = Pato();
  patoAlternativo.caminar();
  patoAlternativo.volar();
  patoAlternativo.nadar();

  // Ejercicio 10: Ejercicio integrador completo
  ejercicioIntegradorCompleto();

  print('\n=== TODOS LOS EJERCICIOS DE POO COMPLETADOS ===');
}
