Bala bala;
Enemigo enemigo;


void setup() {
  size(500, 500);
  startTime = millis();
  bala = new Bala(width/2 - 5, 300, 40, 60, true, 4);
  enemigo = new Enemigo(width/2 - 20, height/2, 40, 20, true);
 
}

void draw() {
  

  background(255);
  
  bala.dibujarBala();
  bala.reasignarPosicionBala(mouseX, mouseY);
  
  
  enemigo.dibujarEnemigo(enemigo.colision(bala.posX, bala.ancho, bala.posY, bala.alto));
  //println(enemigo.colision(bala.posX, bala.ancho, bala.posY, bala.alto));
  

  
}
