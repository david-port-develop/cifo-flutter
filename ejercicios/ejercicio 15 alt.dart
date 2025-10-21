class Persona {
  final Latible corazon; // ✅ Depende de una interfaz, no implementación

  Persona(this.corazon); // ✅ Inyección por constructor

  void vivir() => corazon.latir();
}

abstract class Latible {
  void latir();
}

class Corazon implements Latible {
  @override
  void latir() => print("❤️ Latido natural");
}

class CorazonArtificial implements Latible {
  @override
  void latir() => print("💙 Latido artificial");
}

// Uso:
void main() {
  Persona personaNatural = Persona(Corazon());
  Persona personaPaciente = Persona(CorazonArtificial());

  personaNatural.vivir(); // ❤️ Latido natural
  personaPaciente.vivir(); // 💙 Latido artificial
}


// Hola. Cuando hace unos días dije que crear objetos en nuestros programas rompía el IOC (inversion of control) me refería a que el IOC es una filosofía para mantener los objetos independientes unos de otros para evitar lo que se llama acoplamiento... por ejemplo... en el ejercicio

// 8. Composición (objeto dentro de otro)
// class Persona {
// Corazon corazon = Corazon();  // :x: Acoplamiento fuerte
// void vivir() => corazon.latir();
// }

// Problemas:
// Persona depende de Corazon de forma concreta
// No se puede testear fácilmente (Persona siempre tiene un Corazon real)
// No se puede reutilizar (¿Y si quiero una Persona con corazón artificial?)
// Violación de DIP - Módulos de alto nivel no deberían depender de módulos de bajo nivel

// Para solucionar esto se utiliza lo que se llama la inyección de dependencias, de tal manera, que esto sería desacoplado de la siguiente manera:

// class Persona {
// final Latible corazon;  // :white_check_mark: Depende de una interfaz, no implementación
// Persona(this.corazon);  // :white_check_mark: Inyección por constructor
// void vivir() => corazon.latir();
// }

// abstract class Latible {
// void latir();
// }

// class Corazon implements Latible {
// @override
// void latir() => print(":heart: Latido natural");
// }

// class CorazonArtificial implements Latible {
// @override
// void latir() => print(":blue_heart: Latido artificial");
// }

// // Uso:
// void main() {
// Persona personaNatural = Persona(Corazon());
// Persona personaPaciente = Persona(CorazonArtificial());

// personaNatural.vivir();   // :heart: Latido natural
// personaPaciente.vivir();  // :blue_heart: Latido artificial
// }
