class PowerUp {
  int tipo;
  int posX, posY;
  int ancho, alto;
  String nombre;


  PowerUp(int tipo, int posX, int posY, int ancho, int alto, String nombre) {

    this.tipo = tipo;
    this.posX = posX;
    this.posY = posY;
    this.ancho = ancho;
    this.alto = alto;
    this.nombre = nombre;
  }

  void dibujarPowerUp() {
    noStroke();
    textAlign(CENTER, CENTER);   // horizontal + vertical centering
    fill(255);
    rect(posX, posY -2, 2, 10, 40);
    rect(posX + ancho - 2, posY - 2, 2, 10, 40);

    String etiqueta = "";
    switch (tipo) {
    case 0:
      etiqueta = "Balas x2";
      fill(255, 255, 0, 100);
      break;
    case 1:
      etiqueta = "";
      fill(255, 255, 0, 100);
      break;
    case 2:
      etiqueta = "Balas x3";
      break;
    case 3:
      etiqueta = "Balas x5";
      break;
    }
    textSize(10);
    text(etiqueta, posX + ancho/2, posY + alto/2);
    fill(128,128,128, 50);
    rect(posX, posY, ancho, alto, 10);
  }

  boolean colision(Bala bala) {
    boolean x1 = bala.posX + bala.ancho >= posX;
    boolean x2 = bala.posX <= posX + ancho;
    boolean y1 = bala.posY + bala.alto >= posY;
    boolean y2 = bala.posY <= posY + alto;

    if (x1 && x2 && y1 && y2) println("colision con powerup");

    return x1 && x2 && y1 && y2;
  }

  boolean aplicarEfecto(Bala bala, ArrayList<Bala> nuevasBalas) {
    if (bala.duplicada) return false;   // Bala ya afectada
    if (!colision(bala)) return false;

    bala.duplicada = true;

    switch (tipo) {
    case 0: // duplicar (spread)
      nuevasBalas.add(new Bala(bala.posX - bala.ancho * 2, bala.posY, 2, 3, true, bala.velocidadY, 0, bala.proyectil, true));
      bala.posX = bala.posX + bala.ancho * 2;
      break;
    case 1: // acelerar
      bala.velocidadY += 4;
      break;
    case 2: // triple spread
      nuevasBalas.add(new Bala(bala.posX - bala.ancho * 3, bala.posY, 2, 3, true, bala.velocidadY, 0, bala.proyectil, true));
      nuevasBalas.add(new Bala(bala.posX + bala.ancho * 3, bala.posY, 2, 3, true, bala.velocidadY, 0, bala.proyectil, true));
      break;
    case 3: // quíntuple spread
      nuevasBalas.add(new Bala(bala.posX - bala.ancho * 3, bala.posY, 2, 3, true, bala.velocidadY, 0, bala.proyectil, true));
      nuevasBalas.add(new Bala(bala.posX + bala.ancho * 3, bala.posY, 2, 3, true, bala.velocidadY, 0, bala.proyectil, true));
      nuevasBalas.add(new Bala(bala.posX - bala.ancho * 6, bala.posY, 2, 3, true, bala.velocidadY, 0, bala.proyectil, true));
      nuevasBalas.add(new Bala(bala.posX + bala.ancho * 6, bala.posY, 2, 3, true, bala.velocidadY, 0, bala.proyectil, true));
      break;
    }
    return true;
  }
}
