class Personaje {

  int x;
  int y;
  int ancho;
  int alto;
  PImage imagen;
  int velocidad;


  Personaje(int x, int y, int ancho, int alto, PImage imagen, int velocidad) {

    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;
    this.imagen = imagen;
    this.velocidad = velocidad;
  }

  void movimientoPersonaje() {

    if (keyPressed && key == 'd') {
      println("movimentoPersonaje derecha");

      x += velocidad;
    }
    if (keyPressed && key == 'a') {
      println("movimentoPersonaje izquierda");

      x -= velocidad;
    }
  }


  void dibujarPersonaje() {
    imagen.resize(70, 70);
    //rect(x, y, ancho, alto);
    image(imagen, x - 25, y - 20);
  }


  boolean disparo() {

    if (key == 'g') {
      println("disparo");
      return true;
    } else {
      println("no disparo");
      return false;
    }
  }
}
