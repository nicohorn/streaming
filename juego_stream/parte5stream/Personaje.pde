class Personaje {
  int x;
  int y;
  int ancho;
  int alto;
  PImage derecha[];
  PImage izquierda[];
  PImage idle[];
  int velocidad;
  int velocidadX;   // ← desplazamiento horizontal de este frame

  boolean teclaA = false;   // ← estado de las teclas de movimiento
  boolean teclaD = false;

  Personaje(int x, int y, int ancho, int alto, PImage derecha[], PImage izquierda[], PImage idle[], int velocidad) {
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;
    this.derecha = derecha;
    this.izquierda = izquierda;
    this.idle = idle;
    this.velocidad = velocidad;
  }

  // llamar desde keyPressed() / keyReleased()
  void setTecla(char c, boolean estado) {
    if (c == 'a') teclaA = estado;
    if (c == 'd') teclaD = estado;
  }

  void movimientoPersonaje() {
    velocidadX = 0;   // por default, quieto
    if (teclaD) {
      x += velocidad;
      velocidadX = velocidad;
    }
    if (teclaA) {
      x -= velocidad;
      velocidadX = -velocidad;
    }
  }

  void dibujarPersonaje() {
    if (mostrarHitboxes == true) rect(x, y, ancho, alto);
    if (teclaD) {
      image(derecha[(frameActual/velocidadAnimacion)%idle.length], x - ancho/2, y - 10);
    } else if (teclaA) {
      image(izquierda[(frameActual/velocidadAnimacion)%idle.length], x, y - 10);
    } else {
      image(idle[(frameActual/velocidadAnimacion)%idle.length], x-ancho/2 + 8, y - 10);
    }
  }

  boolean disparo() {
    return key == 'g';
  }
}
