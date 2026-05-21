class Personaje {

  int x;
  int y;
  int ancho;
  int alto;
  PImage derecha[];
  PImage izquierda[];
  PImage idle[];
  int velocidad;


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

    rect(x,y,ancho,alto);

    if (keyPressed && key == 'd') {
      for (int i = 0; i<derecha.length; i++) {
        image(derecha[i], x - ancho/2, y - 10);
   
      }
    }
    else if (keyPressed && key == 'a') {
      for (int i = 0; i<izquierda.length; i++) {
        image(izquierda[i], x, y - 10);
      
      }
    } else {
      for (int i = 0; i<idle.length; i++) {
        image(idle[i], x-ancho/2 + 8, y - 10);
      
      }
    }
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
