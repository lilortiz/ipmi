// Lilo Ortiz - TP1
// 93502/9 - Comisión 1

//Declaración de variables
PImage raya;

void setup(){
  //Tamaño de la ventana
  size(800,400);
  //Cargar imagen
  raya = loadImage("data/raya.jpg");
  
  //Fondo e imagen de refe
  background(56,151,183);
  image(raya,0,0,400,400);
  
  //Raya
  noStroke();
  fill(13,32,47);
  triangle(430,170,770,170,600,300);
  rect(560,115,80,100);
  triangle(430,170,560,115,560,215);
  triangle(640,115,640,215,770,170);
  fill(255);
  triangle(560,115,585,115,575,95);
  triangle(615,115,640,115,625,95);
  strokeWeight(5);
  stroke(255);
  line(455,170,545,200);
  line(545,200,590,280);
  line(745,170,655,200);
  line(655,200,605,280);
  strokeWeight(2);
  line(600,300,615,380);
  stroke(0);
  line(615,380,614,400);
  noStroke();
  fill(56,151,183);
  ellipse(600,95,60,45);

}

void draw(){

}
