PImage fondo;
PImage nebula1;
PImage nebula2;

void fondoJuego() {

  fondo = loadImage("background.png");
  nebula1 = loadImage("nebula_1.png");
  nebula2 = loadImage("nebula_2.png");
  image(fondo, 0, 0);
  image(fondo, 270, 0);
  image(fondo, 0, 480);
  image(fondo, 270, 480);
  image(fondo, 0, 0);
  image(fondo, 540, 0);
  image(fondo, 0, 480);
  image(fondo, 540, 480);



  image(nebula1, 30, 150);
  image(nebula2, 170, 480);
}
