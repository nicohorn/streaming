class Boton {
  float x, y, ancho, alto;
  boolean clickeado;
  int borde = 7;
  String texto;
  int tamano = 20;

  Boton(int x, int y, String texto, int tamano) {
    textSize(tamano);
    this.x = x - textWidth(texto)/2;
    this.y = y;
    this.texto = texto;
    this.ancho = int(textWidth(texto) + 30) ;
    this.alto = int(textAscent() + textDescent()) + 30;
    this.tamano = tamano;
  }

  void dibujarBoton() {
    strokeWeight(5);
    println("width texto "+ textWidth(texto), ancho);
    click();
    fill(19, 38, 92);
    if (clickeado) fill(0, 0, 139);
    rect(x, y, ancho, alto, borde);
    fill(255);
    text(texto, x + ancho/2 - textWidth(texto)/2, y + textAscent() * 1.6);
  }

  boolean click() {
    if (mouseX >= x && mouseX <= x+ancho && mouseY >= y && mouseY<= y+alto && mousePressed) {
      clickeado = true;
      return true;
    }
    clickeado = false;
    return false;
  }
}
