class Enemigo {
  int posX;
  int posY;
  int ancho;
  int alto;
  PImage[] idle;
  PImage[] explosion;
  boolean activa;


  Enemigo(int posX, int posY, int ancho, int alto, boolean activa, PImage[] idle, PImage[] explosion) {
    this.posX = posX;
    this.posY = posY;
    this.ancho = ancho;
    this.alto = alto;
    this.activa = activa;
    this.idle = idle;
    this.explosion = explosion;
  }

  boolean colision(Bala bala) {
    
    
    boolean x1 = this.posX <= bala.posX + bala.ancho;
    boolean x2 = this.posX + this.ancho >= bala.posX;
    boolean y1 = this.posY <= bala.posY + bala.alto;
    boolean y2 = this.posY + this.alto >= bala.posY;

    if (x1 && x2 && y1 && y2) {
      active = false;
      return true;
    }
    return false;
  }

  void dibujarEnemigo(boolean colisionExterna) {
    
    if(colisionExterna && activa == true){
    
      for(){
      
      }
      
    }

    rect(posX, posY, ancho, alto);
    for (int i = 0; i < idle.length; i++) {

      image(idle[i], posX - 3, posY - 10);
    }
  }
}
