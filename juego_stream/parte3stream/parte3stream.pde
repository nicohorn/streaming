ArrayList<Bala> balas = new ArrayList<Bala>();
Enemigo enemigo;
Personaje jugador;

boolean isPressed = false;

Bala pruebaBala = new Bala(200, 450, 2, 3, true, 1);

PImage animacionDerechaJugador[] = new PImage[3];
PImage animacionIzquierdaJugador[] = new PImage[3];
PImage animacionIdle[] = new PImage[3];

PImage animacionEnemigoIdle[] = new PImage[12];



void setup() {
  size(540, 480);
  noFill();
  stroke(255);
  for (int i = 0; i < animacionDerechaJugador.length; i++) {
    animacionDerechaJugador[i] = loadImage("3player_"+ i +".png");
    animacionIzquierdaJugador[i] = loadImage("5player_"+ i +".png");
    animacionIdle[i] = loadImage("1player_"+ i +".png");
  }

  for (int i = 0; i < animacionEnemigoIdle.length; i++) {
    println(i % 3);
    animacionEnemigoIdle[i] = loadImage("1enemy_" + i % 3 + ".png");
  }



  enemigo = new Enemigo(width/2 - 20, 100, 40, 20, true, animacionEnemigoIdle);
  jugador = new Personaje(width/2, height-100, 30, 40, animacionDerechaJugador, animacionIzquierdaJugador, animacionIdle, 5);
}

void draw() {

  fondoJuego();


  for (Bala bala : balas) {
    bala.dibujarBala();
    bala.movimientoBala();
    bala.limiteVertical();
    enemigo.colision(bala);
 
  }
  jugador.dibujarPersonaje();
  jugador.movimientoPersonaje();
  enemigo.dibujarEnemigo(false);



  for (int i = balas.size() - 1; i >= 0; i--) {
    Bala bala = balas.get(i);
    if (!bala.viva) {
      balas.remove(i);
    }
  }
}

void keyPressed() {
  if (jugador.disparo()) {
    balas.add(new Bala(jugador.x + 15, height-100, 2, 3, true, 2));
  }
}
