class Enemigo {
  int posX;
  int posY;
  int ancho;
  int alto;
  boolean activa;

  Enemigo(int posX, int posY, int ancho, int alto, boolean activa) {
    this.posX = posX;
    this.posY = posY;
    this.ancho = ancho;
    this.alto = alto;
    this.activa = activa;
  }

  boolean colision(int posX, int ancho, int posY, int alto) {

    if (this.posX <= posX + ancho && this.posX + this.ancho >= posX && this.posY <= posY + alto && this.posY + this.alto >= posY) {
      return true;
    }
    return false;
  }

  void dibujarEnemigo(boolean colisionExterna) {

    if (colisionExterna == true) {
      activa = false;
    }

    if (activa == true) {
      rect(posX, posY, ancho, alto);
    }
  }
}
