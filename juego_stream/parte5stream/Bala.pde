class Bala {
  float posX;
  float posY;
  int ancho;
  int alto;
  boolean viva;
  int velocidadY;
  float velocidadX;
  PImage proyectil;
  boolean duplicada;

  Bala(float posX, float posY, int ancho, int alto, boolean viva, int velocidadY, float velocidadX, PImage proyectil, boolean duplicada) {
    this.posX = posX;
    this.posY = posY;
    this.ancho = ancho;
    this.alto = alto;
    this.viva = viva;
    this.velocidadY = velocidadY;
    this.velocidadX = velocidadX;
    this.proyectil = proyectil;
    this.duplicada = duplicada;
  }

  void dibujarBala() {
    image(proyectil, posX - 2, posY -2, 6, 15);
    if (mostrarHitboxes == true) {
      rect(posX, posY, ancho, alto);
    }
  }


  void movimientoBala() {
    posY = posY - velocidadY;
    //posX = posX + velocidadX;   
    velocidadX *= 0.98;         
  }

  void limiteVertical() {
    if (posY < 0)
      viva = false;
  }
}
