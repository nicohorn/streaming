// ───── Entidades ─────
ArrayList<Bala> balas = new ArrayList<Bala>();
Enemigo enemigo;
Personaje jugador;
PowerUp powerUpPrueba;

// ───── Animaciones ─────
PImage animacionDerechaJugador[]  = new PImage[3];
PImage animacionIzquierdaJugador[] = new PImage[3];
PImage animacionIdle[]            = new PImage[3];
PImage animacionEnemigoIdle[]     = new PImage[12];
PImage animacionExplosion[]       = new PImage[8];
PImage imagenProyectil;

// ───── Estado global ─────
int frameActual = 0;
int velocidadAnimacion = 5;   // Más alto = animación más lenta.
boolean mostrarHitboxes = false;

// ───── Config de disparo ─────
final int CADENCIA_DISPARO = 5;   // frames entre disparos automáticos


void setup() {
  size(810, 820);
  noFill();
  stroke(255);

  cargarAnimaciones();

  powerUpPrueba = new PowerUp(1, 30, 500, 250, 8, "Balas x2");
  enemigo = new Enemigo(width/2 - 20, 100, 40, 20, true, animacionEnemigoIdle, animacionExplosion);
  jugador = new Personaje(width/2, height - 100, 30, 40,
    animacionDerechaJugador, animacionIzquierdaJugador, animacionIdle, 5);
}


void draw() {
  println(balas.size());
  frameActual++;
  fondoJuego();

  powerUpPrueba.dibujarPowerUp();

  actualizarBalas();
  jugador.movimientoPersonaje();
  jugador.dibujarPersonaje();

  enemigo.dibujarEnemigo();

  if (frameActual % CADENCIA_DISPARO == 0) {
    disparar(10, jugador.velocidadX);
  }
}


void keyPressed() {
  jugador.setTecla(key, true);
  
}

void keyReleased() {
  jugador.setTecla(key, false);
}

// ───── Helpers ─────

void cargarAnimaciones() {
  for (int i = 0; i < animacionDerechaJugador.length; i++) {
    animacionDerechaJugador[i]  = loadImage("3player_" + i + ".png");
    animacionIzquierdaJugador[i] = loadImage("5player_" + i + ".png");
    animacionIdle[i]            = loadImage("1player_" + i + ".png");
  }
  for (int i = 0; i < animacionEnemigoIdle.length; i++) {
    animacionEnemigoIdle[i] = loadImage("1enemy_" + i % 3 + ".png");
  }
  for (int i = 0; i < animacionExplosion.length; i++) {
    animacionExplosion[i] = loadImage("explosion-" + (i + 1) + ".png");
  }
  imagenProyectil = loadImage("projectile_1.png");
}

void actualizarBalas() {
  ArrayList<Bala> nuevasBalas = new ArrayList<Bala>();

  for (Bala bala : balas) {
    bala.movimientoBala();
    bala.limiteVertical();
    enemigo.colision(bala);
    powerUpPrueba.aplicarEfecto(bala, nuevasBalas);
    bala.dibujarBala();
  }
  balas.addAll(nuevasBalas);

  // eliminar balas muertas (de atrás hacia adelante para no romper los índices)
  for (int i = balas.size() - 1; i >= 0; i--) {
    if (!balas.get(i).viva) {
      balas.remove(i);
    }
  }
}

void disparar(int velocidadY, float velocidadX) {
  balas.add(new Bala(jugador.x + 15, height - 100, 2, 3, true,
    velocidadY, velocidadX * 0.3, imagenProyectil, false));
}
