PImage fondo;
PImage nebula1;
PImage nebula2;

void fondoJuego() {
  fondo = loadImage("background.png");
  nebula1 = loadImage("nebula_1.png");
  nebula2 = loadImage("nebula_2.png");
  image(fondo, 0,0);
  image(fondo, 270,0);
  image(nebula1, 30,100);
  image(nebula2, 170,210);
}
