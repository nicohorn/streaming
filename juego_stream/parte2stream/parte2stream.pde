ArrayList<Bala> balas = new ArrayList<Bala>();
Enemigo enemigo;
Personaje jugador;

boolean isPressed = false;

Bala pruebaBala = new Bala(200, 450, 2, 3, true, 1);

PImage imagenJugador;


void setup() {
  size(500, 500);

  imagenJugador = loadImage("personaje.png");

  enemigo = new Enemigo(width/2 - 20, height/2, 40, 20, true);
  jugador = new Personaje(width/2, height-100, 20, 50, imagenJugador, 5);
}

void draw() {

  background(255);


  for (Bala bala : balas) {
    bala.dibujarBala();
    bala.movimientoBala();
    bala.limiteVertical();
    println(balas.size());
  }
  jugador.dibujarPersonaje();
  jugador.movimientoPersonaje();



  for (int i = balas.size() - 1; i >= 0; i--) {
    Bala bala = balas.get(i);
    if (!bala.viva) {
      balas.remove(i);
    }
  }
}

void keyPressed() {
  if (jugador.disparo()) {
    balas.add(new Bala(jugador.x + 5, height-100, 2, 3, true, 2));
  }
}
