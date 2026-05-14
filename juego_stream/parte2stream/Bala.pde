class Bala {
  int posX;
  int posY;
  int ancho;
  int alto;
  boolean viva;
  int velocidad;

  Bala(int posX, int posY, int ancho, int alto, boolean viva, int velocidad) {
    this.posX = posX;
    this.posY = posY;
    this.ancho = ancho;
    this.alto = alto;
    this.viva = viva;
    this.velocidad = velocidad;
  }

  void dibujarBala() {
    fill(255);
    rect(posX, posY, ancho, alto);
  }


  void movimientoBala() {
    posY = posY - velocidad;
  }

  void limiteVertical() {
    if (posY < 0)
      viva = false;
  }
}
