Bala bala;
Enemigo enemigo;

Personaje jugador;


void setup() {
  size(500, 500);

  bala = new Bala(width/2 - 5, 300, 40, 60, true, 4);
  enemigo = new Enemigo(width/2 - 20, height/2, 40, 20, true);
 
}

void draw() {
  

  background(255);
  

  
  enemigo.dibujarEnemigo(enemigo.colision(bala.posX, bala.ancho, bala.posY, bala.alto));
  //println(enemigo.colision(bala.posX, bala.ancho, bala.posY, bala.alto));
  

  
}
