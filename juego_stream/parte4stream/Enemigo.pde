class Enemigo {
  int posX;
  int posY;
  int ancho;
  int alto;
  PImage[] idle;
  PImage[] explosion;
  boolean activo;
  Temporizador temp;
  int frameExplosion;
  int vidas;


  Enemigo(int posX, int posY, int ancho, int alto, boolean activo, PImage[] idle, PImage[] explosion) {
    this.posX = posX;
    this.posY = posY;
    this.ancho = ancho;
    this.alto = alto;
    this.activo = activo;
    this.idle = idle;
    this.explosion = explosion;
    this.vidas = 5;
  }

  boolean colision(Bala bala) {

    boolean x1 = this.posX <= bala.posX + bala.ancho;
    boolean x2 = this.posX + this.ancho >= bala.posX;
    boolean y1 = this.posY <= bala.posY + bala.alto;
    boolean y2 = this.posY + this.alto >= bala.posY;

    if (x1 && x2 && y1 && y2) {
      vidas--;
      bala.viva = false;
      return true;
    }
    return false;
  }

  void dibujarEnemigo() {
    if (vidas <= 0) activo = false;
    if (activo) {
      // Vivo: dibujo normal.
      if (mostrarHitboxes == true) rect(posX, posY, ancho, alto);
      image(idle[(frameActual / velocidadAnimacion) % idle.length], posX - 3, posY - 10);
    } else {
      // Muerto: arranco el timer la primera vez.
      if (temp == null) {
        temp = new Temporizador(1000);
        frameExplosion = 0;  // contador propio de la clase enemigo.
      }

      // Mientras el timer corre, dibujo la explosión
      if (!temp.check()) {
        int idx = (frameExplosion / 5) % explosion.length;
        image(explosion[idx], posX - 3, posY - 10);
        frameExplosion++;
      }
      // Cuando temp.check() devuelve true, dejamos de dibujar nada. El enemigo desaparece.
    }
  }
}
