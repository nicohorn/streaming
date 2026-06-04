class Temporizador{
  int inicio;
  int duracion;
  
  Temporizador(int duracion){
    this.duracion = duracion;
    this.inicio = millis();
  }
  
  boolean check(){
    return millis() - inicio > duracion;
  }
}
